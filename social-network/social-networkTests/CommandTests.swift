//
//  CommandTests.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class CommandTests: XCTestCase {
    var data: SocialNetworkData!

    override func setUp() {
        super.setUp()
        
        data = SocialNetworkData()
    }

    // MARK: Post
    
    func test_post_command() {
        let post = PostCommand(user: "Ana", message: "message")
        
        var end = false
        post.runOnData(data, end: &end)
        
        let messages = data.messagesForUser("Ana")
        XCTAssertEqual(messages.count, 1)
        XCTAssertFalse(end)
        if let first = messages.first {
            XCTAssertEqual(first.message, "message")
        }
    }
    
    // MARK: Read
    
    func test_read_command_no_messages() {
        
        let read = ReadCommand(user: "Ana")
        
        var end = false
        let result = read.runOnData(data, end: &end)
        
        XCTAssertFalse(end)
        XCTAssertEqual(result, [])
    }
    
    func test_read_command_one_messages() {
        let d = DateHelper.dateMinutesFromNow(3)
        let m = Message(message: "message", date: d)
        data.addMessage(m, toUser: "Ana")
        
        let read = ReadCommand(user: "Ana")
        
        var end = false
        let result = read.runOnData(data, end: &end)
        
        XCTAssertFalse(end)
        XCTAssertEqual(result, ["message (3 minutes ago)"])
    }
    
    func test_read_command_two_messages() {
        let user = "Ana"
        let d1 = DateHelper.dateSecondsFromNow(20)
        let m1 = Message(message: "message1", date: d1)
        let d2 = DateHelper.dateSecondsFromNow(3)
        let m2 = Message(message: "message2", date: d2)
        
        data.addMessage(m1, toUser: user)
        data.addMessage(m2, toUser: user)
        
        let read = ReadCommand(user: user)
        
        var end = false
        let result = read.runOnData(data, end: &end)
        
        XCTAssertFalse(end)
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0], "message2 (3 seconds ago)")
        XCTAssertEqual(result[1], "message1 (20 seconds ago)")
    }

    // MARK: Follow
    
    func test_follow_command() {
        let f = FollowCommand(follower: "Ana", followed: "Paco")
        
        var end = false
        f.runOnData(data, end: &end)
        
        XCTAssertFalse(end)
        
        let followedByAna = data.usersFollowedByUser("Ana")
        XCTAssertEqual(followedByAna.count, 1)
        if let first = followedByAna.first {
            XCTAssertEqual(first, "Paco")
        }
        
        let followedByPaco = data.usersFollowedByUser("Paco")
        XCTAssertEqual(followedByPaco.count, 0)
    }
    
    // MARK: Test Wall
    
    func test_wall() {
        data.addFollower("Ana", toUser: "Paco")
        let d = DateHelper.dateMinutesFromNow(3)
        let m = Message(message: "message", date: d)
        data.addMessage(m, toUser: "Paco")
        
        let wall = WallCommand(user: "Ana")
        
        var end = false
        let result = wall.runOnData(data, end: &end)
        
        XCTAssertFalse(end)
        XCTAssertEqual(result.count, 1)
        if let first = result.first {
            XCTAssertEqual(first, "Paco - message (3 minutes ago)")
        }
    }
    
    func test_wall_should_show_own_user_messages() {
        let m = Message(message: "message", date: NSDate())
        data.addMessage(m, toUser: "Ana")
        
        let wall = WallCommand(user: "Ana")
        
        var end = false
        let result = wall.runOnData(data, end: &end)
        
        XCTAssertFalse(end)
        XCTAssertEqual(result.count, 1)
        if let first = result.first {
            XCTAssertEqual(first, "Ana - message (0 seconds ago)")
        }
    }
    
    func test_wall_should_show_newer_messages_first() {
        let dateOlder = DateHelper.dateSecondsFromNow(10)
        let older = Message(message: "older", date: dateOlder)
        let dateNewer = DateHelper.dateSecondsFromNow(5)
        let newer = Message(message: "newer", date: dateNewer)
        
        data.addMessage(older, toUser: "Ana")
        data.addMessage(newer, toUser: "Ana")
        
        let wall = WallCommand(user: "Ana")
        
        var end = false
        let result = wall.runOnData(data, end: &end)
        
        XCTAssertFalse(end)
        XCTAssertEqual(result.count, 2)
        if let first = result.first {
            XCTAssertEqual(first, "Ana - newer (5 seconds ago)")
        }
    }
}
