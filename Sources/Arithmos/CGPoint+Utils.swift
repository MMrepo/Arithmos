//
//  CGPoint+Utils.swift
//  Arithmos
//
//  Created by Mateusz on 15.11.2017.
//  Copyright © 2017 Vindur. All rights reserved.
//

import Foundation
import CoreGraphics
import QuartzCore

public extension CGPoint {

    //MARK: - helpers properties
  static var one:CGPoint {
        return CGPoint(x: 1.0, y: 1.0)
    }
    
    static var mid:CGPoint {
        return CGPoint(x: 0.5, y:0.5)
    }
    
    //MARK: - helpers methods
    func lerp (start: CGPoint, end: CGPoint, time: CGFloat) -> CGPoint {
        return start + (end - start) * time
    }
    
    func vector(to point:CGPoint) -> CGVector {
        return CGVector(dx: point.x-self.x, dy: point.y-self.y)
    }
    
    func moved(by vector:CGVector) -> CGPoint {
        return CGPoint(x: self.x + vector.dx, y: self.y + vector.dy)
    }

    func angle(to point: CGPoint) -> CGFloat {
        return self.vector(to: point).angle
    }
    
    func normalizedAngle(to point: CGPoint) -> CGFloat {
        return self.vector(to: point).normalizedAngle
    }
    
    func distance(to point:CGPoint) -> CGFloat {
        return self.vector(to: point).magnitude
    }
}
