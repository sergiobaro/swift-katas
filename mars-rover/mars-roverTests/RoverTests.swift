//
//  RoverTests.swift
//  mars-roverTests
//
//  Created by Sergio on 29/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


/*
 Rules:
 
 - You are given the initial starting point (x,y) of a rover and the direction (N,S,E,W) it is facing.
 - The rover receives a character array of commands.
 - Implement commands that move the rover forward/backward (f,b).
 - Implement commands that turn the rover left/right (l,r).
 
 - Implement wrapping from one edge of the grid to another. (planets are spheres after all)
 
 - Implement obstacle detection before each move to a new square. 
    If a given sequence of commands encounters an obstacle,
    the rover moves up to the last possible point and reports the obstacle.
 */


class RoverTests: XCTestCase {
    var obstacle: Position!
    var grid: Grid!
    var pos: Position!
    var dir: Direction!
    var rover: Rover!
    
    override func setUp() {
        super.setUp()
        
        obstacle = Position(x: 3, y: 3)
        grid = Grid(width: 4, height: 4, obstacles: [obstacle])
        pos = Position(x: 1, y: 1)
        dir = Direction.North
        rover = Rover(pos: pos, dir: dir, grid: grid)
    }
    
    // Initialization
    
    func test_Rover_initialization() {
        XCTAssertEqual(rover.pos, pos)
        XCTAssertEqual(rover.dir, dir)
        XCTAssertEqual(rover.grid, grid)
    }
    
    // Simple commands
    
    func test_Rover_invalid_command() {
        do {
            try rover.exec("x")
            XCTFail("Error should be thrown")
        } catch RoverError.CommandUnknown(let command) {
            XCTAssertEqual(command, "x")
        } catch {
            XCTFail("Unexpected error \(error)")
        }
    }
    
    func test_Rover_forward_command() {
        try! rover.exec("f")
        
        XCTAssertEqual(rover.pos, Position(x:1, y:2))
        XCTAssertEqual(rover.dir, Direction.North)
    }
    
    func test_Rover_backward_command() {
        try! rover.exec("b")
        
        XCTAssertEqual(rover.pos, Position(x:1, y:0))
        XCTAssertEqual(rover.dir, Direction.North)
    }
    
    func test_Rover_right_command() {
        try! rover.exec("r")
        
        XCTAssertEqual(rover.pos, Position(x:1, y:1))
        XCTAssertEqual(rover.dir, Direction.East)
    }
    
    func test_Rover_left_command() {
        try! rover.exec("l")
        
        XCTAssertEqual(rover.pos, Position(x:1, y:1))
        XCTAssertEqual(rover.dir, Direction.West)
    }
    
    // Chained commands
    
    func test_Rover_two_commands() {
        try! rover.exec("rf")
        
        XCTAssertEqual(rover.pos, Position(x: 2, y: 1))
        XCTAssertEqual(rover.dir, Direction.East)
    }
    
    func test_Rover_three_commands() {
        try! rover.exec("llb")
        
        XCTAssertEqual(rover.pos, Position(x: 1, y: 2))
        XCTAssertEqual(rover.dir, Direction.South)
    }
    
    func test_Rover_complex_command() {
        try! rover.exec("frflb")
        
        XCTAssertEqual(rover.pos, Position(x: 2, y: 1))
        XCTAssertEqual(rover.dir, Direction.North)
    }
    
    // Circular grid
    
    func test_Rover_circular_grid_top() {
        try! rover.exec("ffff")
        
        XCTAssertEqual(rover.pos, Position(x: 1, y:1))
    }
    
    func test_Rover_circular_grid_bottom() {
        try! rover.exec("bb")
        
        XCTAssertEqual(rover.pos, Position(x: 1, y: 3))
    }
    
    func test_Rover_circular_grid_left() {
        try! rover.exec("lff")
        
        XCTAssertEqual(rover.pos, Position(x: 3, y: 1))
    }
    
    func test_Rover_circular_grid_right() {
        try! rover.exec("rfff")
        
        XCTAssertEqual(rover.pos, Position(x: 0, y: 1))
    }
    
    // Obstacles
    func test_Rover_obstacles() {
        do {
            try rover.exec("ffrff")
            XCTFail("Error should be thrown")
        } catch RoverError.ObstacleFound(let pos) {
            XCTAssertEqual(pos, obstacle)
        } catch {
            XCTFail("Unexpected error \(error)")
        }
        
        XCTAssertEqual(rover.pos, Position(x: 2, y: 3))
        XCTAssertEqual(rover.dir, Direction.East)
    }
    
}
