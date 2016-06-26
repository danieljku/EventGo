//
//  SignUpContinuedViewController.swift
//  EventGo
//
//  Created by Nicholas Swift on 6/26/16.
//  Copyright © 2016 djku. All rights reserved.
//

import Foundation
import UIKit

class SignUpContinuedViewController: UIViewController {
    
    static var firstName: String!
    static var lastName: String!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func completeAction(sender: AnyObject) {
        //print(self.firstName + self.lastName + emailField.text + passwordField.text + confirmPasswordField.text)
    }
    
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
    
    static func continueFromSignUp(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}