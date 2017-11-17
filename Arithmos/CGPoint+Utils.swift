//
//  CGPoint+Utils.swift
//  Arithmos
//
//  Created by Mateusz on 15.11.2017.
//  Copyright © 2017 Vindur. All rights reserved.
//

import Foundation

public extension CGPoint {

    //MARK: - helpers properties
    static public var one:CGPoint {
        return CGPoint(x: 1.0, y: 1.0)
    }
    
    static public var mid:CGPoint {
        return CGPoint(x: 0.5, y:0.5)
    }
    
    //MARK: - helpers methods
    public func lerp (start: CGPoint, end: CGPoint, time: CGFloat) -> CGPoint {
        return start + (end - start) * time
    }
    
    public func vector(to point:CGPoint) -> CGVector {
        return CGVector(dx: point.x-self.x, dy: point.y-self.y)
    }
    
    public func moved(by vector:CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }

    public func angle(to point: CGPoint) -> CGFloat {
        return self.vector(to: point).angle
    }
    
    public func normalizedAngle(to point: CGPoint) -> CGFloat {
        return self.vector(to: point).normalizedAngle
    }
    
    public func distance(to point:CGPoint) -> CGFloat {
        return self.vector(to: point).magnitude
    }
}
