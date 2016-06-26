//   eventNameLabel.text
//
//  EventPageViewController.swift
//  EventGo
//
//  Created by Daniel Ku on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import UIKit

class EventPageViewController: UIViewController {
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var eventPage: Event?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Reading from server
        let apiURL = NSURL(string: "http://curtastic.com/eventtogo/?action=getevents")
        
        let request = NSURLRequest(URL: apiURL!)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ (data, response, error) in
            
            if error == nil {
                guard let data = data else { print("No data was returned by the request!"); return }
                
                let parsedResult: AnyObject!
                
                do {
                    // Serialize means converting object to streams of bytes
                    print(data)
                    parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                    
                    print(parsedResult)
                }
                catch {
                    print("Could not parse the data as JSON: '\(data)'")
                    return
                }
                
                if let dictionary = parsedResult["events"] {
                    print(dictionary)
                    
                    for each in dictionary as! [[String : String]]{
                        print(each["userid"])
                    }
                    
                    return
                }
                
            }
        }


        //Retrieve data from ViewController and insert into text fields of the labels
        eventNameLabel.text = eventPage!.eventName
        dateLabel.text = eventPage!.eventDate
        addressLabel.text = eventPage!.eventAddress
        stateLabel.text = eventPage!.eventState
        cityLabel.text = eventPage!.eventCity
        zipCodeLabel.text = String(eventPage!.eventZipCode)
        costLabel.text = "$" + String(eventPage!.eventCost)
        descriptionTextView.text = eventPage!.eventDescription

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
