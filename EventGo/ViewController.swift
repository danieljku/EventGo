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
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    var eventArr = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let apiURL = NSURL(string: "http://curtastic.com/eventtogo/?action=getevents")
        
        let request = NSURLRequest(URL: apiURL!)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ (data, response, error) in
            
            if error == nil {
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let eventPageController = segue.destinationViewController as! EventPageController
        if segue.identifier == "EventPage"{
            eventPageController.eventList = eventArr
        }
    }*/
    


    
    @IBAction func createEventButton(sender: AnyObject) {
        let event = Event()
        event.eventName = eventNameField.text!
        event.eventDate = dateField.text!
        event.eventLocation = locationField.text!
        event.eventCost = costField.text!
        event.eventDescription = eventDescriptionField.text!
        
        eventArr.append(event)
        
        
        self.eventNameLabel.text = String(eventNameField.text!)
        self.dateLabel.text = String(dateField.text!)
        self.locationLabel.text = String(locationField.text!)
        self.costLabel.text = String(costField.text!)
        self.descriptionTextView.text = String(eventDescriptionField.text!)
    }
    
    @IBAction func addImageButton(sender: AnyObject) {

    }
    
    
    
}

