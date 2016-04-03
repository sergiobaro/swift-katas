//
//  main.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation

let view = SocialNetworkTerminalView()
let socialNetwork = SocialNetwork(view: view)

socialNetwork.run()
