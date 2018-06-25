//
//  NumberContainer.swift
//  Hash2Pics
//
//  Created by Artyom Alekseev on 25.06.2018.
//

import UIKit

class NumberContainer: NSObject {
    var isContainerFilled : Bool {
        return (numbers != nil && numbers!.count > 0)
    }
    
    
    private var currentCollectionIndex = 0
    
    private var numbers : [UInt8]?
    
    private var maxNumber: UInt8? {
        guard isContainerFilled else {
            return nil
        }
        
        return self.numbers!.max()
    }
    
    init(numbers: [UInt8]) {
        self.numbers = numbers
        
        super.init()
    }
    
    func nextNumber() -> UInt8? {
        guard self.numbers != nil && self.numbers!.count > 0 else {
            return nil
        }
        
        let result = numbers![currentCollectionIndex]
        nextIndex()
        
        return result
    }
    
    func nextFraction() -> CGFloat? {
        guard isContainerFilled else {
            return nil
        }
        
        guard CGFloat(maxNumber!) != 0 else {
            return nil
        }
        
        return CGFloat(nextNumber()!) / CGFloat(maxNumber!)
    }
    
    private func nextIndex() {
        currentCollectionIndex += 1
        if currentCollectionIndex == numbers!.count {
            currentCollectionIndex = 0
        }
    }
}
