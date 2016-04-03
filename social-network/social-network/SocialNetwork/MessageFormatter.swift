//
//  MessageFormatter.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class MessageFormatter {
    
    class func formatMessage(m: Message) -> String {
        let minutes = DateHelper.minutesFromNow(m.date)
        if (minutes == 0) {
            let seconds = DateHelper.secondsFromNow(m.date)
            return "\(m.message) (\(seconds) seconds ago)"
        }
        
        return "\(m.message) (\(minutes) minutes ago)"
    }
    
}