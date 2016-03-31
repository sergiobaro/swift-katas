//
//  Position.swift
//  mars-rover
//
//  Created by Sergio on 29/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


func ==(lhs: Position, rhs: Position) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y)
}


struct Position: Equatable {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(pos: Position) {
        x = pos.x
        y = pos.y
    }
    
    func add(pos: Position) -> Position {
        let x = self.x + pos.x
        let y = self.y + pos.y
        
        return Position(x: x, y: y)
    }
    
    func subtract(pos: Position) -> Position {
        let x = self.x - pos.x
        let y = self.y - pos.y
        
        return Position(x: x, y: y)
    }
}
