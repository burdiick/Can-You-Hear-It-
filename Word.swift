//
//  Word.swift
//  Can You Hear It?
//
//  Created by Daniel Burdick on 10/24/14.
//  Copyright (c) 2014 Daniel Burdick. All rights reserved.
//

import Foundation
import CoreData

class Word: NSManagedObject {
    @NSManaged var nativeWord: String
    @NSManaged var translatedWord: String
    @NSManaged var dateAdded: NSDate
    @NSManaged var lastDatePracticed: NSDate
    @NSManaged var totalTimesHeared: Int
    
    func updateDatePracticed() {
        lastDatePracticed = NSDate()
    }
    
    func heardOnce() {
        self.totalTimesHeared++
    }
    
    func heardNTimes(add: Int) {
        self.totalTimesHeared += add
    }
    
    func unheardOnce(){
        if self.totalTimesHeared > 0 {
            self.totalTimesHeared--
        } else {
            self.totalTimesHeared = 0
        }
    }
    
    func unheardNTimes(subtract: Int) {
        if self.totalTimesHeared > subtract {
            self.totalTimesHeared -= subtract
        } else {
            self.totalTimesHeared = 0
        }
    }
}