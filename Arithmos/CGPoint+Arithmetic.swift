//
//  CGPoint+Arithmetic.swift
//  Arithmos
//
//  Created by Mateusz on 17.12.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation

public extension CGPoint {
    
    static public func + (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x + right.x, y: left.y + right.y)
    }
    
    static public func += (left: inout CGPoint, right: CGPoint) {
        left = left + right
    }
    
    static public func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }
    
    static public func -= (left: inout CGPoint, right: CGPoint) {
        left = left - right
    }
    
    static public func * (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x * right.x, y: left.y * right.y)
    }
    
    static public func *= (left: inout CGPoint, right: CGPoint) {
        left = left * right
    }
    
    static public func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }
    
    static public func *= (point: inout CGPoint, scalar: CGFloat) {
        point = point * scalar
    }
    
    static public func / (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x / right.x, y: left.y / right.y)
    }
    
    static public func /= (left: inout CGPoint, right: CGPoint) {
        left = left / right
    }
    
    static public func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x / scalar, y: point.y / scalar)
    }
    
    static public func /= (point: inout CGPoint, scalar: CGFloat) {
        point = point / scalar
    }
}
