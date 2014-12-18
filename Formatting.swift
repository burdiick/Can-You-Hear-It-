//
//  Formatting.swift
//  Can You Hear It?
//
//  Created by Daniel Burdick on 10/27/14.
//  Copyright (c) 2014 Daniel Burdick. All rights reserved.
//

import Foundation

class Formatting {
    
    func formatDate(date: NSDate) -> String {
        var formatter : NSDateFormatter = NSDateFormatter()
        
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        formatter.timeZone = NSTimeZone()
        formatter.dateFormat = "dd/MM/yy"
        
        return formatter.stringFromDate(date)
    }
}