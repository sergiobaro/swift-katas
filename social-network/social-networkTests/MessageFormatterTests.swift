//
//  MessageFormatterTests.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class MessageFormatterTests: XCTestCase {

    func test_message_minutes() {
        let d = DateHelper.dateMinutesFromNow(3)
        let m = Message(message: "message", date: d)
        
        let result = MessageFormatter.formatMessage(m)
        
        XCTAssertEqual(result, "message (3 minutes ago)")
    }

    func test_message_seconds() {
        let d = DateHelper.dateSecondsFromNow(27)
        let m = Message(message: "message", date: d)
        
        let result = MessageFormatter.formatMessage(m)
        
        XCTAssertEqual(result, "message (27 seconds ago)")
    }

}
