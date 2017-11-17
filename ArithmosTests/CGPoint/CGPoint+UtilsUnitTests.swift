//
//  CGPoint+UtilsUnitTests.swift
//  ArithmosTests
//
//  Created by Mateusz on 17.12.2017.
//

import Foundation
import XCTest
@testable import Arithmos

class CGPoint_UtilsUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //MARK: - `vector(to:) -> CGVector`
    func testVectorToPointReturnsVectorZeroForSelf() {
        let point = CGPoint(x: 100, y: 100)
        let zeroVector = CGVector.zero
        XCTAssertEqual(point.vector(to: point), zeroVector)
    }
    
    func testVectorToBetweenTwoPointsReturnsCorrectValue() {
        let point1 = CGPoint(x: 1, y: 1)
        let point2 = CGPoint(x: 4, y: 5)
        let resultVector = CGVector(dx: 3, dy: 4)
        XCTAssertEqual(point1.vector(to: point2), resultVector)
    }
    
    //MARK: - `distance(to:) -> CGFloat`
    func testDistanceToReturnsZeroForSelf() {
        let point1 = CGPoint(x: 1, y: 1)
        XCTAssertEqual(point1.distance(to:point1), 0.0)
    }
    
    func testDistanceToBetweenTwoPointsReturnsCorrectValue() {
        let point1 = CGPoint(x: 1, y: 1)
        let point2 = CGPoint(x: 4, y: 5)
        XCTAssertEqual(point1.distance(to:point2), 5.0)
    }
}

