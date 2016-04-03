//
//  DateHelper.swift
//  social-network
//
//  Created by Sergio on 02/04/2016.
//  Copyright © 2016 Sergio Baró Simó. All rights reserved.
//

import Foundation


class DateHelper {
    
    class func dateSecondsFromNow(seconds: Int) -> NSDate {
        let timeInterval = NSTimeInterval(-seconds)
        let now = NSDate()
        
        return now.dateByAddingTimeInterval(timeInterval)
    }
    
    class func dateMinutesFromNow(minutes: Int) -> NSDate {
        let seconds = NSTimeInterval(minutes * 60)
        let now = NSDate()
        
        return now.dateByAddingTimeInterval(-seconds)
    }
    
    class func secondsFromNow(date: NSDate) -> Int {
        let seconds = date.timeIntervalSinceNow
        
        return -Int(seconds)
    }
    
    class func minutesFromNow(date: NSDate) -> Int {
        let seconds = date.timeIntervalSinceNow
        
        return -Int(seconds / 60)
    }
    
}

extension NSDate : Comparable {}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}
