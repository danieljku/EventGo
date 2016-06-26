//   eventNameLabel.text
//
//  EventPageViewController.swift
//  EventGo
//
//  Created by Daniel Ku on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var event = Event()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //noteTitleTextField.delegate = self
        descriptionTextView.delegate = self
        descriptionTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).CGColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.cornerRadius = 5
        

        
        eventNameLabel.font = UIFont.boldSystemFontOfSize(16.0)
        eventNameLabel.text = event.name
        
        let subtitle = event.address
        
        let fullAddr = subtitle.characters.split{$0 == ","}.map(String.init)
        addressLabel.text = fullAddr[0] + ","
        cityLabel.text = fullAddr[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) + ","
        
        let stateZiparr = fullAddr[2]
        let stateZip = stateZiparr.characters.split{$0 == " "}.map(String.init)
        
        stateLabel.text = stateZip[0].uppercaseString
        zipCodeLabel.text = stateZip[1]
        descriptionTextView.text = fullAddr[3].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        
        event.address = addressLabel.text!
        event.zipCode = zipCodeLabel.text!
        event.state = stateLabel.text!
        event.description = descriptionTextView.text!
        event.city = cityLabel.text!
    
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "goingSegue" {
//            //let viewController = segue.destinationViewController as! MyEventsTableTableViewController
//            
//            //viewController.event.append(event)
//        }
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
