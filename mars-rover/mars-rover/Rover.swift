//
//  Rover.swift
//  mars-rover
//
//  Created by Sergio on 29/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


enum RoverError: ErrorType {
    case CommandUnknown(command: String)
    case ObstacleFound(pos: Position)
}


class Rover {
    var pos: Position {
        return roverPos.pos
    }
    var dir: Direction {
        return roverDir.dir
    }
    var grid: Grid {
        return roverPos.grid
    }
    
    private let roverDir: RoverDirection
    private let roverPos: RoverPosition
    
    init(pos: Position, dir: Direction, grid: Grid) {
        self.roverDir = RoverDirection(dir: dir)
        self.roverPos = RoverPosition(pos: pos, grid: grid)
    }
    
    func exec(commands: String) throws {
        
        for command in commands.characters {
            switch command {
            case "f":
                try roverPos.forwardDirection(dir)
            case "b":
                try roverPos.backwardDirection(dir)
            case "r":
                roverDir.turnRight()
            case "l":
                roverDir.turnLeft()
            default:
                throw RoverError.CommandUnknown(command: String(command))
            }
        }
    }
    
}
