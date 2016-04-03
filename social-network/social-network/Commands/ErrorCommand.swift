//
//  ErrorCommand.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class ErrorCommand: Command {
    let line: String
    
    init(line: String) {
        self.line = line
    }
    
    func runOnData(data: SocialNetworkData, inout end: Bool) -> [String] {
        return ["not a command: \(line)"]
    }
    
}