//
//  NumbersManager.swift
//  Hash2Pics
//
//  Created by Artyom Alekseev on 25.06.2018.
//

import UIKit

class NumbersManager: NSObject {
    var isEmpty : Bool {
        return (numbers == nil || numbers!.count == 0)
    }
    
    private var currentCollectionIndex = 0
    
    private var numbers : [UInt8]?
    
    private var maxNumber: UInt8? {
        guard !isEmpty else {
            return nil
        }
        
        return self.numbers!.max()
    }
    
    init(numbers: [UInt8]) {
        self.numbers = numbers
        
        super.init()
    }
    
    func skipNext() {
        nextIndex()
    }
    
    func nextNumber() -> UInt8? {
        guard !isEmpty else {
            return nil
        }
        
        let result = numbers![currentCollectionIndex]
        nextIndex()
        
        return result
    }
    
    func nextRatio() -> CGFloat? {
        guard !isEmpty else {
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
