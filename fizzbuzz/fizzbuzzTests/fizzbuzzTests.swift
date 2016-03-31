//
//  fizzbuzzTests.swift
//  fizzbuzzTests
//
//  Created by Sergio on 20/03/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest

class FizzBuzzTests: XCTestCase {
    
    var texter: FizzbuzzTexter!
    
    override func setUp() {
        self.texter = FizzbuzzTexter()
    }
    
    func test_multiple_three_not_five() {
        XCTAssertEqual(self.texter.textForNumber(3), "Fizz")
        XCTAssertEqual(self.texter.textForNumber(6), "Fizz")
        XCTAssertEqual(self.texter.textForNumber(9), "Fizz")
    }
    
    func test_multiple_five_not_three() {
        XCTAssertEqual(self.texter.textForNumber(5), "Buzz")
        XCTAssertEqual(self.texter.textForNumber(10), "Buzz")
        XCTAssertEqual(self.texter.textForNumber(20), "Buzz")
    }
    
    func test_multiple_five_and_three() {
        XCTAssertEqual(self.texter.textForNumber(15), "FizzBuzz")
        XCTAssertEqual(self.texter.textForNumber(30), "FizzBuzz")
        XCTAssertEqual(self.texter.textForNumber(45), "FizzBuzz")
        XCTAssertEqual(self.texter.textForNumber(60), "FizzBuzz")
    }
    
    func test_not_multiple_three_nor_five() {
        XCTAssertEqual(self.texter.textForNumber(1), "1")
        XCTAssertEqual(self.texter.textForNumber(2), "2")
        XCTAssertEqual(self.texter.textForNumber(4), "4")
        XCTAssertEqual(self.texter.textForNumber(7), "7")
        XCTAssertEqual(self.texter.textForNumber(8), "8")
        XCTAssertEqual(self.texter.textForNumber(11), "11")
    }
    
}
