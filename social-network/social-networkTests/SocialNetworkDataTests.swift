//
//  SocialNetworkDataTests.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class SocialNetworkDataTests: XCTestCase {
    var data: SocialNetworkData!
    
    override func setUp() {
        super.setUp()
        
        data = SocialNetworkData()
    }

    // MARK: Adding messages
    
    func test_add_message() {
        let message = Message(message: "message", date: NSDate())
        data.addMessage(message, toUser: "Ana")
        
        let messages = data.messagesForUser("Ana")
        XCTAssertEqual(messages.count, 1)
        
        if let first = messages.first {
            XCTAssertEqual(first.message, message.message)
            XCTAssertEqual(first.date, message.date)
        }
    }
    
    func test_add_two_messges() {
        let m1 = Message(message: "message1", date: NSDate())
        let m2 = Message(message: "message2", date: NSDate())
        
        data.addMessage(m1, toUser: "Ana")
        data.addMessage(m2, toUser: "Ana")
        
        let messages = data.messagesForUser("Ana")
        XCTAssertEqual(messages.count, 2)
    }
    
    func test_messages_for_unexistant_user() {
        let m = Message(message: "message", date: NSDate())
        data.addMessage(m, toUser: "Ana")
        
        let messages = data.messagesForUser("Paco")
        XCTAssertEqual(messages.count, 0)
    }
    
    // MARK: Test following users
    
    func test_following_user() {
        data.addFollower("Ana", toUser: "Paco")
        let result = data.usersFollowedByUser("Ana")
        
        XCTAssertEqual(result.count, 1)
        
        if let first = result.first {
            XCTAssertEqual(first, "Paco")
        }
    }
    
}
