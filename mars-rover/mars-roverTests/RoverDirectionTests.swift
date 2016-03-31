//
//  RoverDirectionTests.swift
//  mars-rover
//
//  Created by Sergio on 30/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class RoverDirectionTests: XCTestCase {
    
    func test_Direction_initialize() {
        let roverDir = RoverDirection(dir: .East)
        
        XCTAssertEqual(roverDir.dir, Direction.East)
    }
    
    func test_Direction_turnLeft() {
        let roverDir = RoverDirection(dir: .South)
        roverDir.turnLeft()
        
        XCTAssertEqual(roverDir.dir, Direction.East)
    }
    
    func test_Direction_turnRight() {
        let roverDir = RoverDirection(dir: .South)
        roverDir.turnRight()
        
        XCTAssertEqual(roverDir.dir, Direction.West)
    }

}
