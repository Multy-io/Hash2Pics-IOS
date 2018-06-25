//
//  TextLayer.swift
//  Hash2Pics
//
//  Created by Artyom Alekseev on 25.06.2018.
//

import UIKit

class TextLayer : CATextLayer {
    
    override func draw(in ctx: CGContext) {
        let height = self.bounds.size.height
        let fontSize = self.fontSize
        let yDiff = (height-fontSize)/2 - fontSize/10
        
        ctx.saveGState()
        ctx.translateBy(x: 0.0, y: yDiff)
        super.draw(in: ctx)
        ctx.restoreGState()
    }
}
