//
//  WallCommand.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class WallCommand: Command {
    let user: String
    
    init(user: String) {
        self.user = user
    }
    
    func runOnData(data: SocialNetworkData, inout end: Bool) -> [String] {
        let messages = collectAllMessages(data)
        
        return messages.sort { (m1, m2) -> Bool in
                return (m1.date > m2.date)
            }.map(MessageFormatter.formatMessage)
    }
    
    // MARK: Private
    
    private func collectAllMessages(data: SocialNetworkData) -> [Message] {
        var messages = messagesFromUser(user, data: data)
        
        let followedUsers = data.usersFollowedByUser(user)
        for followed in followedUsers {
            let followedMessages = messagesFromUser(followed, data: data)
            messages.appendContentsOf(followedMessages)
        }
        
        return messages
    }
    
    private func messagesFromUser(user: String, data: SocialNetworkData) -> [Message] {
        var result = [Message]()
        
        let messages = data.messagesForUser(user)
        for message in messages {
            let messageString = "\(user) - \(message.message)"
            let newMessage = Message(message: messageString, date: message.date)
            
            result.append(newMessage)
        }
        
        return result
    }
    
}
