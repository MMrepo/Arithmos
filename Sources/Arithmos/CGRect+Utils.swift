//
//  CGRect+Utils.swift
//  Arithmos
//
//  Created by Mateusz on 28.11.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation
import CoreGraphics
import QuartzCore

public extension CGRect {

    var incircleRadius: CGFloat {
        return min(self.size.width, self.size.height)/2
    }
    
    var circumcircleRadius: CGFloat {
        return sqrt(self.size.width*self.size.width + self.size.height*self.size.height)/2.0
    }
    
    var center: CGPoint {
        get {
            return CGPoint(x: midX, y: midY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
    
    var centralSquare: CGRect {
        let side = min(size.width, size.height)
        var square = CGRect(origin: CGPoint.zero, size: CGSize(width: side, height: side))
        square.center = self.center
        return square
    }
}
