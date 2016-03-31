//
//  PositionTests.swift
//  mars-rover
//
//  Created by Sergio on 29/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class PositionTests: XCTestCase {
    
    func test_Position_equality() {
        let pos1 = Position(x: 1, y: 1)
        let pos2 = Position(x: 0, y: 0)
        let pos3 = Position(x: 1, y: 1)
        
        XCTAssertEqual(pos1, pos3)
        XCTAssertNotEqual(pos1, pos2)
    }
    
    func test_Position_add() {
        let pos1 = Position(x: 1, y: 1)
        let pos2 = Position(x: 0, y: 1)
        
        let result = pos1.add(pos2)
        XCTAssertEqual(result.x, 1)
        XCTAssertEqual(result.y, 2)
    }
    
    func test_Position_subtract() {
        let pos1 = Position(x: 1, y: 1)
        let pos2 = Position(x: 0, y: 1)
        
        let result = pos1.subtract(pos2)
        XCTAssertEqual(result.x, 1)
        XCTAssertEqual(result.y, 0)
    }
    
}
