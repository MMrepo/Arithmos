//
//  Lerpable.swift
//  Arithmos
//
//  Created by Mateusz Małek on 24/08/2019.
//  Copyright © 2017 Vindur. All rights reserved.
//

import Foundation

public protocol Lerpable {
    func lerp(min: Self, max: Self) -> Self
    func ilerp(min: Self, max: Self) -> Self
}

public func lerp<T: Lerpable>(_ weighting: T, min: T, max: T) -> T {
    return weighting.lerp(min: min, max: max)
}

public func ilerp<T: Lerpable>(_ value: T, min: T, max: T) -> T {
    return value.ilerp(min: min, max: max)
}
