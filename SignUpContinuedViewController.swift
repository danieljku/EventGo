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
    
    var firstName: String!
    var lastName: String!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func completeAction(sender: AnyObject) {
        print(self.firstName + self.lastName + emailField.text! + passwordField.text! + confirmPasswordField.text!)
        
        let errorRedColor = UIColor(red: 241/255, green: 0/255, blue: 0/255, alpha: 255/255)
        let errorGreenColor = UIColor(red: 67/255, green: 160/255, blue: 157/255, alpha: 255/255)
        
        ServerHelper.createUser(emailField.text!, password: passwordField.text!, firstName: self.firstName, lastName: self.lastName)
        if(ServerHelper.userCreated! == true) {
            self.errorLabel.textColor = errorGreenColor
            self.errorLabel.text = "Successfully created account."
            self.errorLabel.fadeIn(completion: {
                (finished: Bool) -> Void in
                self.performSegueWithIdentifier("CreatedUserSegue", sender: sender)
            })
            
            //self.performSegueWithIdentifier("MapSegue", sender: sender)
            
        }
        else {
            self.errorLabel.textColor = errorRedColor
            self.errorLabel.text = "Could not create account."
        }
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
}