//
//  CGPoint+Arithmetic.swift
//  Arithmos
//
//  Created by Mateusz on 17.12.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation
import CoreGraphics
import QuartzCore

public extension CGPoint {
    
    static func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    
    static func += (left: inout CGPoint, right: CGPoint) {
        left = left + right
    }
    
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    static func -= (left: inout CGPoint, right: CGPoint) {
        left = left - right
    }
    
    static func * (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x * right.x, y: left.y * right.y)
    }
    
    static func *= (left: inout CGPoint, right: CGPoint) {
        left = left * right
    }
    
    static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    static func *= (point: inout CGPoint, scalar: CGFloat) {
        point = point * scalar
    }
    
    static func / (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x / right.x, y: left.y / right.y)
    }
    
    static func /= (left: inout CGPoint, right: CGPoint) {
        left = left / right
    }
    
    static func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x / scalar, y: point.y / scalar)
    }
    
    static func /= (point: inout CGPoint, scalar: CGFloat) {
        point = point / scalar
    }
}
