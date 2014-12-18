//
//  ViewController.swift
//  Can You Hear It?
//
//  Created by Daniel Burdick on 10/24/14.
//  Copyright (c) 2014 Daniel Burdick. All rights reserved.
//

import UIKit
import CoreData

class MainTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    var list: LessonList!
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        list = LessonList()
        println(managedObjectContext!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var format = Formatting()
        
        let cell: CellForLessonList = tableView.dequeueReusableCellWithIdentifier("LessonList", forIndexPath: indexPath) as CellForLessonList
        cell.name.text = "\(list.list[indexPath.row].name)"
        cell.date.text = format.formatDate(list.list[indexPath.row].lastDateWorked)
        cell.wordCount.text = "\(list.list[indexPath.row].wordCount)"
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "toLesson") {
            var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow()!
            
            var lessonController : LessonViewController = segue.destinationViewController as LessonViewController
            
            lessonController.lesson = self.list.list[indexPath.row]
        }else if (segue.identifier == "addLesson") {
            
            let newLesson = NSEntityDescription.insertNewObjectForEntityForName("Lesson", inManagedObjectContext: self.managedObjectContext!) as Lesson
            
            var addLessonController : AddLessonViewController = segue.destinationViewController as AddLessonViewController
            
            addLessonController.lesson = newLesson
        }
        
        
    }

}

