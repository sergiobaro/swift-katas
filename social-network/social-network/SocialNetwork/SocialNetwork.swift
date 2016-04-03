//
//  SocialNetwork.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class SocialNetwork {
    let view: SocialNetworkView
    let data = SocialNetworkData()
    
    init(view: SocialNetworkView) {
        self.view = view
    }
    
    func run() {
        view.printLine("Social Network:\n")
        
        var end = false
        while (!end) {
            let line = view.read()
            
            let command = CommandFactory.commandFromLine(line)
            let lines = command.runOnData(data, end: &end)
            
            for line in lines {
                view.printLine(line)
            }
        }
    }
    
}
