//
//  ViewController.swift
//  EventGo
//
//  Created by Daniel Ku on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var eventNameField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var locationField: UITextField!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var eventDescriptionField: UITextView!

    var eventArr = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.hidesBackButton = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let eventPageController = segue.destinationViewController as! EventPageController
        if segue.identifier == "EventPage"{
            eventPageController.eventList = eventArr
        }
    }

    
    
    @IBAction func addImageButton(sender: AnyObject) {

    }
    
    

    @IBAction func createEventButton(sender: AnyObject) {
        let event = Event()
        event.eventName = eventNameField.text!
        event.eventDate = dateField.text!
        event.eventLocation = locationField.text!
        event.eventCost = costField.text!
        event.eventDescription = eventDescriptionField.text!
        
        eventArr.append(event)
    }
    
    
}

