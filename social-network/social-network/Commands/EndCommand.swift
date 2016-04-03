//
//  EndCommand.swift
//  social-network
//
//  Created by Sergio on 03/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class EndCommand : Command {
    
    func runOnData(data: SocialNetworkData, inout end: Bool) -> [String] {
        end = true
        
        return []
    }
    
}
