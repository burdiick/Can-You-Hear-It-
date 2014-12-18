//
//  AddWords.swift
//  Can You Hear It?
//
//  Created by Daniel Burdick on 10/27/14.
//  Copyright (c) 2014 Daniel Burdick. All rights reserved.
//

import Foundation
import UIKit

class PickExistingWordController : UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    //var newLesson: Lesson = Lesson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}