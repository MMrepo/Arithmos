//
//  FloatingPoint+Extensions.swift
//  Arithmos
//
//  Created by Mateusz on 28.11.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation

extension FloatingPoint {
  
    public func normalizedAngle() -> Self {
        if self == 2 * .pi {
            return self
        }
        return (self + 2 * .pi).truncatingRemainder(dividingBy: 2 * .pi)
    }
}
