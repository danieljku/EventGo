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

        // Do any additional setup after loading the view.
        
        self.eventNameLabel.text = eventPage!.eventName
        self.dateLabel.text = eventPage!.eventDate
        self.addressLabel.text = eventPage!.eventAddress
        self.stateLabel.text = eventPage!.eventState
        self.cityLabel.text = eventPage!.eventCity
        self.zipCodeLabel.text = eventPage!.eventZipCode
        self.costLabel.text = eventPage!.eventCost
        self.descriptionTextView.text = eventPage!.eventDescription

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
