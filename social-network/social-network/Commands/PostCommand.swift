//
//  PostCommand.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class PostCommand: Command {
    let user: String
    let message: String
    
    init(user: String, message: String) {
        self.user = user
        self.message = message
    }
    
    func runOnData(data: SocialNetworkData, inout end: Bool) -> [String] {
        let m = Message(message: message, date: NSDate())
        data.addMessage(m, toUser: user)
        
        return []
    }
    
}