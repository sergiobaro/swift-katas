//
//  FollowCommand.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class FollowCommand: Command {
    let follower: String
    let followed: String
    
    init(follower: String, followed: String) {
        self.follower = follower
        self.followed = followed
    }
    
    func runOnData(data: SocialNetworkData, inout end: Bool) -> [String] {
        data.addFollower(follower, toUser: followed)
        
        return []
    }
    
}