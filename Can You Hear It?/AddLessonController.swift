//
//  AddLesson.swift
//  Can You Hear It?
//
//  Created by Daniel Burdick on 10/27/14.
//  Copyright (c) 2014 Daniel Burdick. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddLessonViewController: UIViewController {
    
    var lesson: Lesson!
    
    @IBAction func continuePressed(sender: UIButton!) {
        
        var lessonViewController: LessonViewController = LessonViewController()
        
        lesson.name = nameTextField.text
        var newWord: Word = NSEntityDescription.insertNewObjectForEntityForName("Word", inManagedObjectContext: lesson.managedObjectContext!) as Word
        newWord.nativeWord = "Hello"
        newWord.translatedWord = "Hola"

        //lesson.addWord(newWord)
        lesson.wordCount = 0
        lesson.dateAdded = NSDate()

        lessonViewController.lesson = lesson;
        
        
        navigationController?.pushViewController(lessonViewController, animated: false)
    }
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (nameTextField.text != nil) {
            
            var lessonViewController: LessonViewController = segue.destinationViewController as LessonViewController
            
            lesson.name = nameTextField.text
            
            lessonViewController.lesson = lesson;
        }
    }

}
