//
//  CGFloat+Utils.swift
//  Arithmos
//
//  Created by Mateusz Małek on 24/08/2019.
//  Copyright © 2017 Vindur. All rights reserved.
//

import Foundation
import CoreGraphics
import QuartzCore

extension CGFloat: Lerpable {
    
    public func lerp(min: CGFloat, max: CGFloat) -> CGFloat {
        return min + (self * (max - min))
    }
    
    public func ilerp(min: CGFloat, max: CGFloat) -> CGFloat {
        return (self - min) / (max - min)
    }
}
