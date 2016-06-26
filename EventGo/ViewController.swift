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
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var costField: UITextField!
    @IBOutlet weak var eventDescriptionField: UITextView!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var eventList = Event()

    //var pictureAddHelper: PictureAddHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*let apiURL = NSURL(string: "http://curtastic.com/eventtogo/?action=getevents")
        
        let request = NSURLRequest(URL: apiURL!)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ (data, response, error) in
            
            if error == nil {
                
            }
        }*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let eventPageViewController = segue.destinationViewController as! EventPageViewController
        if segue.identifier == "EventPage"{
            eventPageViewController.eventPage = eventList
            
            eventPageViewController.eventPage?.eventName = eventNameField.text!
            eventPageViewController.eventPage?.eventDate = dateField.text!
            eventPageViewController.eventPage?.eventAddress = addressField.text!
            eventPageViewController.eventPage?.eventCity = cityField.text!
            eventPageViewController.eventPage?.eventState = stateField.text!
            eventPageViewController.eventPage?.eventZipCode = Int(zipCodeField.text!)!
            eventPageViewController.eventPage?.eventCost = Double(costField.text!)!
            eventPageViewController.eventPage?.eventDescription = eventDescriptionField.text!
     }
    }
    
    
    @IBAction func createEventButton(sender: AnyObject) {
        guard let eventName = String(eventNameField.text!) else{
            
        }

    }
    
    @IBAction func addImageButton(sender: AnyObject) {
        print("choose photo")
        //pictureAddHelper!.showPhotoSourceSelection()
    }
    
    
    
}

