//
//  SocialNetworkData.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


struct Message {
    var message: String
    var date: NSDate
}


class SocialNetworkData {
    private var messages = [String: [Message]]()
    private var followed = [String: Set<String>]()
    
    func addMessage(message: Message, toUser user: String) {
        if self.messages[user] == nil {
            createUser(user)
        }
        
        self.messages[user]!.append(message)
    }
    
    func messagesForUser(user: String) -> [Message] {
        if let messages = self.messages[user] {
            return messages
        }
        
        return []
    }
    
    func addFollower(follower: String, toUser user: String) {
        if self.followed[follower] == nil {
            self.createUser(follower)
        }
        
        self.followed[follower]!.insert(user)
    }
    
    func usersFollowedByUser(user: String) -> [String] {
        if let followed = self.followed[user] {
            return Array(followed)
        }
        
        return []
    }
    
    // MARK: Private
    
    private func createUser(user: String) {
        self.messages[user] = [Message]()
        self.followed[user] = Set<String>()
    }
    
}
