//
//  CommandFactoryTests.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class CommandFactoryTests: XCTestCase {

    func test_post_command() {
        let command = CommandFactory.commandFromLine("Ana -> Hello World!")
        
        XCTAssert(command is PostCommand)
        if let post = command as? PostCommand {
            XCTAssertEqual(post.user, "Ana")
            XCTAssertEqual(post.message, "Hello World!")
        }
    }
    
    func test_read_command() {
        let command = CommandFactory.commandFromLine("Ana")
        
        XCTAssert(command is ReadCommand)
        
        if let read = command as? ReadCommand {
            XCTAssertEqual(read.user, "Ana")
        }
    }
    
    func test_follow_command() {
        let command = CommandFactory.commandFromLine("Ana follows Paco")
        
        XCTAssert(command is FollowCommand)
        
        if let follow = command as? FollowCommand {
            XCTAssertEqual(follow.follower, "Ana")
            XCTAssertEqual(follow.followed, "Paco")
        }
    }
    
    func test_wall_command() {
        let command = CommandFactory.commandFromLine("Paco wall")
        
        XCTAssert(command is WallCommand)
        
        if let wall = command as? WallCommand {
            XCTAssertEqual(wall.user, "Paco")
        }
    }
    
}
