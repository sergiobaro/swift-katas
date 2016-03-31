//
//  GridTests.swift
//  mars-rover
//
//  Created by Sergio on 30/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class GridTests: XCTestCase {
    
    func test_Grid_equality() {
        let grid1 = Grid(width: 3, height: 3, obstacles: nil)
        let grid2 = Grid(width: 5, height: 5, obstacles: nil)
        let grid3 = Grid(width: 3, height: 3, obstacles: nil)
        
        XCTAssertNotEqual(grid1, grid2)
        XCTAssertEqual(grid1, grid3)
    }
    
    func test_Grid_inside() {
        let grid = Grid(width: 4, height: 4, obstacles: nil)
        
        let leftBottom = Position(x: 0, y: 0)
        let rightUpper = Position(x: 3, y: 3)
        
        XCTAssertTrue(grid.inside(leftBottom))
        XCTAssertTrue(grid.inside(rightUpper))
        
        let outsideBottom = Position(x: 2, y: -1)
        let outsideUpper = Position(x: 2, y: 5)
        let outsideLeft = Position(x: -1, y: 0)
        let outsideRight = Position(x: 4, y: 3)
        
        XCTAssertFalse(grid.inside(outsideBottom))
        XCTAssertFalse(grid.inside(outsideUpper))
        XCTAssertFalse(grid.inside(outsideLeft))
        XCTAssertFalse(grid.inside(outsideRight))
    }
    
    func test_Grid_hasObstacle() {
        let obstacle = Position(x: 2, y: 2)
        let free = Position(x: 1, y: 3)
        let grid = Grid(width: 4, height: 4, obstacles: [obstacle])
        
        XCTAssertTrue(grid.hasObstacle(obstacle))
        XCTAssertFalse(grid.hasObstacle(free))
    }
    
    func test_Grid_noObstacles_hasObstacle() {
        let pos = Position(x: 1, y: 1)
        let grid = Grid(width: 3, height: 3)
        
        XCTAssertFalse(grid.hasObstacle(pos))
    }

}
