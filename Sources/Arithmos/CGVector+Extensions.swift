//
//  CGVector+Extensions.swift
//  Arithmos
//
//  Created by Mateusz on 16.12.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation
import CoreGraphics
import QuartzCore

public extension CGVector {
    
    //MARK: - helpers properties
    var magnitude:CGFloat {
        return hypot(dx, dy)
    }
    
    var squareMagnitude:CGFloat {
        return dx*dx + dy*dy
    }
    
    var angle: CGFloat {
        return atan2(dy, dx)
    }
    
    var normalizedAngle: CGFloat {
        return angle.normalizedAngle()
    }
    
    func normalized() -> CGVector {
        let magnitude = self.magnitude
        return magnitude > 0 ? self/magnitude : .zero
    }
    
    static func + (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }
    
    static func += (left: inout CGVector, right: CGVector) {
        left = left + right
    }
    
    static func - (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }
    
    static func -= (left: inout CGVector, right: CGVector) {
        left = left - right
    }
    
    static func * (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx * right.dx, dy: left.dy * right.dy)
    }
    
    static func *= (left: inout CGVector, right: CGVector) {
        left = left * right
    }
    
    static func * (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }
    
    static func *= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector * scalar
    }
    
    static func / (left: CGVector, right: CGVector) -> CGVector {
        return CGVector(dx: left.dx / right.dx, dy: left.dy / right.dy)
    }
    
    static func /= (left: inout CGVector, right: CGVector) {
        left = left / right
    }
    
    static func / (vector: CGVector, scalar: CGFloat) -> CGVector {
        return CGVector(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
    
    static func /= (vector: inout CGVector, scalar: CGFloat) {
        vector = vector / scalar
    }
}
