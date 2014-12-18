//
//  Lesson.swift
//  Can You Hear It?
//
//  Created by Daniel Burdick on 10/25/14.
//  Copyright (c) 2014 Daniel Burdick. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Lesson: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var words: [Word]
    @NSManaged var dateAdded: NSDate
    @NSManaged var lastDateWorked: NSDate
    @NSManaged var wordCount: Int
    
    func addWord (word: Word) {
        words.append(word)
    }
    
}