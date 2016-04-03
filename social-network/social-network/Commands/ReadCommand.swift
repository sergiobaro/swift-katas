//
//  ReadCommand.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class ReadCommand: Command {
    let user: String
    
    init(user: String) {
        self.user = user
    }
    
    func runOnData(data: SocialNetworkData, inout end: Bool) -> [String] {
        var result = [String]()
        
        let messages = data.messagesForUser(user).reverse()
        
        for message in messages {
            let text = MessageFormatter.formatMessage(message)
            result.append(text)
        }
        
        return result
    }
    
}