//
//  RoverPosition.swift
//  mars-rover
//
//  Created by Sergio on 31/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class RoverPosition {
    let grid: Grid
    var pos: Position
    
    init(pos: Position, grid: Grid) {
        self.pos = pos
        self.grid = grid
    }
    
    // MARK: Public
    
    func forwardDirection(dir: Direction) throws {
        let move = moves[dir]!
        let newPos = pos.add(move)
        try moveToPosition(newPos)
    }
    
    func backwardDirection(dir: Direction) throws {
        let move = moves[dir]!
        let newPos = pos.subtract(move)
        try moveToPosition(newPos)
    }
    
    // MARK: Private
    
    private let moves: [Direction: Position] = [.North: Position(x: 0, y: 1),
                                                 .East: Position(x: 1, y: 0),
                                                .South: Position(x: 0, y: -1),
                                                 .West: Position(x: -1, y: 0)]
    
    private func stayOnGridPosition(pos: Position) -> Position {
        var result = Position(pos: pos)
        
        if (result.x < 0) {
            result.x = grid.width - 1
        }
        else if (result.x >= grid.width) {
            result.x = 0
        }
        else if (result.y < 0) {
            result.y = grid.height - 1
        }
        else if (pos.y >= grid.height) {
            result.y = 0
        }
        
        return result
    }
    
    private func moveToPosition(newPos: Position) throws {
        let attempPos = stayOnGridPosition(newPos)
        if (grid.hasObstacle(attempPos)) {
            throw RoverError.ObstacleFound(pos: attempPos)
        }
        else {
            pos = attempPos
        }
    }
}
