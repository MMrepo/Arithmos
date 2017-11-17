//
//  CGPoint+UtilsPropertyTests.swift
//  ArithmosTests
//
//  Created by Mateusz on 17.12.2017.
//  Copyright © 2017 vindur. All rights reserved.
//

import Foundation
import XCTest
import SwiftCheck

@testable import Arithmos

extension CGFloat : Arbitrary {
    public static var arbitrary : Gen<CGFloat> {
        return Double.arbitrary.map() { CGFloat($0) }
    }
    
    public static func shrink(x : CGFloat) -> [CGFloat] {
        return Double.shrink(Double(x)).map() { CGFloat($0) }
    }
}

extension CGPoint : Arbitrary {
    public static var arbitrary : Gen<CGPoint> {
        return Gen<(CGFloat, CGFloat)>.zip(CGFloat.arbitrary, CGFloat.arbitrary).map(CGPoint.init)
    }
}


class CGPoint_UtilsPropertyTests: XCTestCase {
    func testUtils() {
        XCTAssert(fileCheckOutput(withPrefixes: ["CHECK-UTILS"]) {
           
            // CHECK-UTILS: *** Passed 100 tests
            // CHECK-NEXT: .
            property("Distance between two points is always greater or equal to zero") <- forAll({ (point1 : CGPoint, point2: CGPoint) -> Bool in
                return point1.distance(to:point2) >= 0
            })
            
            // CHECK-UTILS: *** Passed 100 tests
            // CHECK-NEXT: .
            property("Distance between two points is always greater or equal to zero") <- forAll({ (point1 : CGPoint, point2: CGPoint) -> Bool in
                return point1.distance(to:point2) >= 0
            })
        })
    }
    
    
    #if !(os(macOS) || os(iOS) || os(watchOS) || os(tvOS))
    static var allTests = testCase([
    ("testUtils", testUtils),
    ])
    #endif
}
