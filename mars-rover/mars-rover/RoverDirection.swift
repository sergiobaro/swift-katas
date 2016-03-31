//
//  Direction.swift
//  mars-rover
//
//  Created by Sergio on 29/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


enum Direction {
    case North
    case South
    case East
    case West
}


class RoverDirection {
    var dir: Direction {
        return dirs[dirIndex]
    }
    
    private var dirIndex: Int
    private let dirs: [Direction] = [.North, .East, .South, .West]
    
    convenience init() {
        self.init(dir: .North)
    }
    
    init(dir: Direction) {
        self.dirIndex = dirs.indexOf(dir)!
    }
    
    func turnRight() {
        dirIndex = dirIndex + 1
        if (dirIndex > dirs.count) {
            dirIndex = 0
        }
    }
    
    func turnLeft() {
        dirIndex = dirIndex - 1
        if (dirIndex < 0) {
            dirIndex = dirs.count - 1
        }
    }
    
}
