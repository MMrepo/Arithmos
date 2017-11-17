//
//  CGVector+Extensions.swift
//  Arithmos
//
//  Created by Mateusz on 16.12.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation

public extension CGVector {
    
    //MARK: - helpers properties
    public var magnitude:CGFloat {
        return hypot(dx, dy)
    }
    
    public var squareMagnitude:CGFloat {
        return dx*dx + dy*dy
    }
    
    public var angle: CGFloat {
        return atan2(dy, dx)
    }
    
    public var normalizedAngle: CGFloat {
        return angle.normalizedAngle()
    }
    
    public func normalized() -> CGVector {
        let magnitude = self.magnitude
        return magnitude > 0 ? self/magnitude : .zero
    }
    
    static public func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    static public func += (left: inout CGVector, right: CGVector) {
        left = left + right
    }
    
    static public func - (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }
    
    static public func -= (left: inout CGVector, right: CGVector) {
        left = left - right
    }
    
    static public func * (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx * right.dx, dy: left.dy * right.dy)
    }
    
    static public func *= (left: inout CGVector, right: CGVector) {
        left = left * right
    }
    
    static public func * (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    static public func *= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector * scalar
    }
    
    static public func / (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx / right.dx, dy: left.dy / right.dy)
    }
    
    static public func /= (left: inout CGVector, right: CGVector) {
        left = left / right
    }
    
    static public func / (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
    
    static public func /= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector / scalar
    }
}
