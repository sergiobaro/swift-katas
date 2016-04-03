//
//  CommandFactory.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class CommandFactory {
    class func commandFromLine(line: String) -> Command {
        var words = line.componentsSeparatedByString(" ")
        
        if (words.count == 1 && words[0] == "end") {
            return EndCommand()
        }
        
        if (words.count == 1) {
            return ReadCommand(user: words[0])
        }
        
        if (words.count == 2 && words[1] == "wall") {
            return WallCommand(user: words[0])
        }
        
        if (words.count == 3 && words[1] == "follows") {
            return FollowCommand(follower: words[0], followed: words[2])
        }
        
        if (words.count >= 3 && words[1] == "->") {
            let user = words[0]
            words.removeRange(0...1)
            let message = words.joinWithSeparator(" ")
            
            return PostCommand(user: user, message: message)
        }
        
        return ErrorCommand(line: line)
    }
}