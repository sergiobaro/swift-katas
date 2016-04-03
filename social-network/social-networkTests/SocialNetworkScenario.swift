//
//  SocialNetworkScenario.swift
//  social-network
//
//  Created by Sergio on 03/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import XCTest


class SocialNetworkScenario: XCTestCase {
    
    class SocialNetworkViewMock : SocialNetworkView {
        var input = [String]()
        var output = [String]()
        
        func printLine(line: String) {
            output.append(line)
        }
        
        func read() -> String {
            if input.count > 0 {
                return input.removeAtIndex(0)
            }
            else {
                return ""
            }
        }
    }
    
    var viewMock: SocialNetworkViewMock!
    var socialNetwork: SocialNetwork!
    
    override func setUp() {
        super.setUp()
        
        viewMock = SocialNetworkViewMock()
        socialNetwork = SocialNetwork(view: viewMock)
    }
    
    // MARK: Test View
    
    func test_view_input() {
        let text = "Ana -> Hello"
        viewMock.input = [text]
        
        let result = viewMock.read()
        
        XCTAssertEqual(result, text)
    }
    
    func test_view_output() {
        let text = "Hello (1 minute ago)"
        
        viewMock.printLine(text)
        
        XCTAssertEqual(viewMock.output.count, 1)
        XCTAssertEqual(viewMock.output.first, text)
    }
    
    // MARK: Scenario
    
    func test_scenario() {
        viewMock.input = ["Alice -> I love the weather today",
                      "Bob -> Damn! We lost!",
                      "Bob -> Good game though.",
                      "Alice",
                      "Bob",
                      "Charlie -> I'm in New York today! Anyone wants to have a coffee?",
                      "Charlie follows Alice",
                      "Charlie wall",
                      "Charlie follows Bob",
                      "Charlie wall",
                      "end"]
        
        let expected = ["Social Network:\n",
                        "I love the weather today (0 seconds ago)",
                        "Good game though. (0 seconds ago)",
                        "Damn! We lost! (0 seconds ago)",
                        "Charlie - I'm in New York today! Anyone wants to have a coffee? (0 seconds ago)",
                        "Alice - I love the weather today (0 seconds ago)",
                        "Charlie - I'm in New York today! Anyone wants to have a coffee? (0 seconds ago)",
                        "Bob - Good game though. (0 seconds ago)",
                        "Bob - Damn! We lost! (0 seconds ago)",
                        "Alice - I love the weather today (0 seconds ago)"]
        
        socialNetwork.run()
        
        XCTAssertEqual(viewMock.output.count, expected.count)
        for i in 0..<expected.count {
            if (viewMock.output.count <= i) {
                XCTFail("\(i)")
            }
            else {
                let actualLine = viewMock.output[i]
                let expectedLine = expected[i]
                XCTAssertEqual(actualLine, expectedLine, "\(i)")
            }
        }
        
    }

}







