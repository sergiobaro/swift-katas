//
//  SocialNetworkTerminalView.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class SocialNetworkTerminalView: SocialNetworkView {
    func printLine(line: String) {
        print(line)
    }
    func read() -> String {
        if let line = readLine() {
            return line
        }
        
        return ""
    }
}