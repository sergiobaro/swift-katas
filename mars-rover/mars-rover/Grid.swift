//
//  Grid.swift
//  mars-rover
//
//  Created by Sergio on 29/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


func ==(lhs: Grid, rhs: Grid) -> Bool {
    return (lhs.width == rhs.width) && (rhs.height == rhs.height)
}


struct Grid: Equatable {
    let width: Int
    let height: Int
    let obstacles: [Position]?
    
    init(width: Int, height: Int) {
        self.init(width: width, height: height, obstacles: nil)
    }
    
    init(width: Int, height: Int, obstacles: [Position]?) {
        self.width = width
        self.height = height
        self.obstacles = obstacles
    }
    
    func inside(pos: Position) -> Bool {
        if (pos.x < 0 || pos.x >= width) {
            return false
        }
        if (pos.y < 0 || pos.y >= height) {
            return false
        }
        
        return true
    }
    
    func hasObstacle(pos: Position) -> Bool {
        if let obstacles = self.obstacles {
            return obstacles.contains(pos)
        }
        
        return false
    }
    
}
