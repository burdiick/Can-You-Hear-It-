//
//  LessonViewController.swift
//  Can You Hear It?
//
//  Created by Daniel Burdick on 10/25/14.
//  Copyright (c) 2014 Daniel Burdick. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class LessonViewController : UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var lesson: Lesson!
    
    @IBOutlet weak var lessonTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //lessonTitle.title = lesson.name
        
        println(lesson.name)
        func alphabetized(s1: Word, s2: Word) -> Bool
        {
            return s1.translatedWord < s2.translatedWord
        }
        
        lesson.words = sorted(lesson.words, alphabetized)
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        self.lesson.words[indexPath.row].heardOnce()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lesson.words.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: CellForLesson = tableView.dequeueReusableCellWithIdentifier("Lesson", forIndexPath: indexPath) as CellForLesson
        
        cell.name.text = "\(self.lesson.words[indexPath.row].nativeWord)"
        cell.count.text = "\(self.lesson.words[indexPath.row].totalTimesHeared)"
        cell.translation.text = "\(self.lesson.words[indexPath.row].translatedWord)"
        
        return cell
    }

}