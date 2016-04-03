//
//  DateHelperTests.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class DateHelperTests: XCTestCase {
    
    func test_minutes() {
        let date = DateHelper.dateMinutesFromNow(3)
        let minutes = DateHelper.minutesFromNow(date)
        
        XCTAssertEqual(minutes, 3)
    }
    
    func test_seconds() {
        let date = DateHelper.dateSecondsFromNow(33)
        let seconds = DateHelper.secondsFromNow(date)
        
        XCTAssertEqual(seconds, 33)
    }
    
    func test_date_comparable() {
        let d1 = DateHelper.dateSecondsFromNow(3)
        let d2 = DateHelper.dateSecondsFromNow(5)
        
        XCTAssertTrue(d1 > d2)
        XCTAssertTrue(d2 < d1)
        XCTAssertLessThan(d2, d1)
        XCTAssertGreaterThan(d1, d2)
    }
    
}
