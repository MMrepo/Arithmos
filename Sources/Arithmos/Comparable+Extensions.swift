//
//  Comparable+Extensions.swift
//  Arithmos
//
//  Created by Mateusz on 10.12.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation
import CoreGraphics
import QuartzCore

extension Comparable {
    public func clamped(_ lowerBound: Self, _ upperBound: Self) -> Self {
        return self < lowerBound ? lowerBound : (self > upperBound ? upperBound : self)
    }
    
    @discardableResult public mutating func clamp(_ lowerBound: Self, _ upperBound: Self) -> Self {
        self = clamped(lowerBound, upperBound)
        return self
    }
    
    public func clamped(in range: ClosedRange<Self>) -> Self {
        return clamped(range.lowerBound, range.upperBound)
    }
}

extension FloatingPoint & Comparable  {
    public func clampedAngle(_ lowerBound: Self, _ upperBound: Self) -> Self {
        let angle = self.normalizedAngle()
        let lB = lowerBound.normalizedAngle()
        let uB = upperBound.normalizedAngle()
       
        if lB < uB {
            return clamped(lB, uB)
        } else {
            return (0...(.pi) ~= angle ? clamped(0, uB) : clamped(lB, 2 * .pi))
        }
    }
    
    @discardableResult public mutating func clampAngle(_ lowerBound: Self, _ upperBound: Self) -> Self {
        self = clampedAngle(lowerBound, upperBound)
        return self
    }
    
    public func clampedAngle(in range: ClosedRange<Self>) -> Self {
        return clampedAngle(range.lowerBound, range.upperBound)
    }
}


