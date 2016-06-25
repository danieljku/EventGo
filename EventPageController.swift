//
//  EventPageController.swift
//  EventGo
//
//  Created by Daniel Ku on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import Foundation
import UIKit

class EventPageController: UIViewController{
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var eventList: [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func someFunction(){
        self.eventNameLabel.text = "HI"
        self.dateLabel.text = ""
        self.locationLabel.text = "HI"
        self.costLabel.text = ""
        self.descriptionTextView.text = "HI"
    }
    
    @IBAction func goingButton(sender: AnyObject) {
    }
}

