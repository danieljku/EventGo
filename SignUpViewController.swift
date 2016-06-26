//
//  SignUpViewController.swift
//  EventGo
//
//  Created by Nicholas Swift on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    let errorRedColor = UIColor(red: 241/255, green: 0/255, blue: 0/255, alpha: 255/255)
    let errorGreenColor = UIColor(red: 67/255, green: 160/255, blue: 157/255, alpha: 255/255)
    
    @IBAction func continueButtonAction(sender: AnyObject) {
        // Start fade out
        self.errorLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            
            if self.firstNameField.text == nil || self.firstNameField.text == "" || self.lastNameField.text == nil || self.lastNameField.text == "" {
                self.errorLabel.textColor = self.errorRedColor
                self.errorLabel.text = "Please enter a first and last name."
            }
            else {
                self.errorLabel.textColor = self.errorGreenColor
                self.errorLabel.text = "Continuing on!"
                SignUpContinuedViewController.continueFromSignUp(self.firstNameField.text!, lastName: self.lastNameField.text!)
            }
            
            // Start fade in
            self.errorLabel.fadeIn()
        })
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change text of certain things
        errorLabel.text = ""
        
        // Make keyboard go down when tapped outside
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
}