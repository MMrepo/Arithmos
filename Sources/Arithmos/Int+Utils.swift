//
//  Int+Utils.swift
//  Arithmos
//
//  Created by Mateusz Małek on 16.01.2018.
//

import Foundation

//MARK: - Repeat action
extension Int {
    func times(_ repeatAction: () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                repeatAction()
            }
        }
    }
    
    func times(_ repeatAction: @autoclosure () -> ()) {
        if self > 0 {
            for _ in 0..<self {
                repeatAction()
            }
        }
    }
}
