//
//  PictureConstructor.swift
//  Hash2Pics
//
//  Created by Artyom Alekseev on 26.06.2018.
//

import Foundation

public class PictureConstructor: NSObject {
    private var palette =  [#colorLiteral(red: 0.003921568627, green: 0.5333333333, blue: 0.5490196078, alpha: 1), #colorLiteral(red: 0.9882352941, green: 0.4588235294, blue: 0, alpha: 1), #colorLiteral(red: 0.01176470588, green: 0.3098039216, blue: 0.3647058824, alpha: 1), #colorLiteral(red: 0.968627451, green: 0.2470588235, blue: 0.003921568627, alpha: 1), #colorLiteral(red: 0.9882352941, green: 0.09803921569, blue: 0.3764705882, alpha: 1), #colorLiteral(red: 0.7803921569, green: 0.07843137255, blue: 0.2980392157, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.7568627451, blue: 0, alpha: 1), #colorLiteral(red: 0.08235294118, green: 0.5960784314, blue: 0.9490196078, alpha: 1), #colorLiteral(red: 0.1411764706, green: 0.3960784314, blue: 0.8823529412, alpha: 1), #colorLiteral(red: 0.9450980392, green: 0.6196078431, blue: 0.007843137255, alpha: 1)]
    private var layersAmount = 3
    
    public func createPicture(diameter: CGFloat, seed: String) -> UIImage? {
        let seedNumbers = [UInt8](seed.utf8)
        let numbersManager = NumbersManager(numbers: seedNumbers)
        numbersManager.skipNext()
        
        guard !numbersManager.isEmpty else {
            return nil
        }
        
        var extractColorTuple = extractColor(colors: palette, numbersManager: numbersManager)
        var remainingColors = extractColorTuple.1
        
        let baseView = getBaseView(diameter: diameter, color: extractColorTuple.0!)
        
        for layerIndex in 0..<layersAmount {
            extractColorTuple = extractColor(colors: remainingColors, numbersManager: numbersManager)
            remainingColors = extractColorTuple.1
            
            
            let layer = getLayer(diameter: diameter, layerIndex: layerIndex, color: extractColorTuple.0!, numbersManager: numbersManager)
            baseView.layer.addSublayer(layer)
        }
        
        if seed.count > 2 {
            let title = String(seed[seed.index(seed.startIndex, offsetBy: seed.count - 2)..<seed.index(seed.startIndex, offsetBy: seed.count)]).uppercased()
            let textLayer = getTextLayer(diameter: diameter, text: title)
            baseView.layer.addSublayer(textLayer)
        }
        
        return UIImage(view: baseView)
    }
    
    private func extractColor(colors: [UIColor], numbersManager: NumbersManager) -> (UIColor?, [UIColor]) {
        guard colors.count > 0 else {
            return (nil, colors)
        }
        
        var remainingColors = colors
        
        let idx = Int(numbersManager.nextNumber()!) % colors.count
        let color = remainingColors.remove(at: idx)
        return (color, remainingColors)
    }
    
    private func getBaseView(diameter : CGFloat, color: UIColor) -> UIView {
        let scaleFactor = UIScreen.main.scale
        let diameterInPixels = diameter * scaleFactor
        
        let result = UIView(frame: CGRect(x: 0, y: 0, width: diameterInPixels, height: diameterInPixels))
        result.layer.cornerRadius = diameterInPixels / 2
        result.layer.masksToBounds = true
        
        result.backgroundColor = color
        
        return result
    }
    
    private func getLayer(diameter: CGFloat, layerIndex: Int, color: UIColor, numbersManager: NumbersManager) -> CALayer {
        let scaleFactor = UIScreen.main.scale
        let diameterInPixels = diameter * scaleFactor
        let result = CALayer()
        result.frame = CGRect(x: 0, y: 0, width: diameterInPixels, height: diameterInPixels)
        
        // rotation
        let rotationRatio = numbersManager.nextRatio()!
        let radians = (rotationRatio * 360) * .pi / 180
        
        // translation
        var translateMultiplier : CGFloat = 0
        switch layerIndex {
        case 1:
            translateMultiplier = -1.0
            break
            
        case 2:
            translateMultiplier = 1.0
            break
            
        default:
            break
        }
        
        let txRaw = numbersManager.nextRatio()! * diameterInPixels
        let tx = 0.6 * diameterInPixels * translateMultiplier + (txRaw > diameterInPixels / 2 ? (diameterInPixels / 2 - txRaw) : txRaw)
        let tyRaw = numbersManager.nextRatio()! * diameterInPixels
        let ty = 0.6 * diameterInPixels * translateMultiplier + (tyRaw > diameterInPixels / 2 ? (diameterInPixels / 2 - tyRaw) : tyRaw)
        
        // transformation
        var transform = CATransform3DMakeTranslation(tx, ty, 0)
        transform = CATransform3DRotate(transform, radians, 0, 0, 1)
        result.transform = transform
        
        // color
        result.backgroundColor = color.cgColor
        
        return result
    }
    
    private func getTextLayer(diameter: CGFloat, text: String) -> TextLayer {
        let scaleFactor = UIScreen.main.scale
        let diameterInPixels = diameter * scaleFactor
        let result = TextLayer()
        result.frame = CGRect(x: 0, y: 0, width: diameterInPixels, height: diameterInPixels)
        result.string = text
        result.alignmentMode = kCAAlignmentCenter
        let fontSize = 0.4 * diameterInPixels
        result.font = UIFont(name: "AvenirNext-Bold", size: fontSize)
        result.fontSize = fontSize
        result.foregroundColor = UIColor.white.cgColor
        
        
        return result
    }
}

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}
