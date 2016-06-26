//
//  SignInViewController.swift
//  EventGo
//
//  Created by Nicholas Swift on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func signInAction(sender: AnyObject) {
        
        let errorRedColor = UIColor(red: 241/255, green: 0/255, blue: 0/255, alpha: 255/255)
        let errorGreenColor = UIColor(red: 67/255, green: 160/255, blue: 157/255, alpha: 255/255)
        
        // Start fade out
        self.errorLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            
            // Check username and password
            if(ServerHelper.attemptLogin(self.usernameField.text, password: self.passwordField.text)) {
                self.errorLabel.textColor = errorGreenColor
                self.errorLabel.text = "Successfully signed in."
                // MOVE ON TO WINNIE'S MAPS!
            }
            else {
                self.errorLabel.textColor = errorRedColor
                self.errorLabel.text = "The username or password is incorrect."
            }
            
            /*if let user = self.usernameField.text {
                if let pass = self.passwordField.text {
                    if user == "user" && pass == "pass" {
                        self.errorLabel.textColor = errorGreenColor
                        self.errorLabel.text = "Successfully signed in."
                    }
                    else {
                        self.errorLabel.textColor = errorRedColor
                        self.errorLabel.text = "The username or password is incorrect."
                    }
                }
            }*/
            
            // Start fade in
            self.errorLabel.fadeIn()
        })
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove keyboard on tap
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Change text of certain things
        errorLabel.text = ""
    }
}

extension UIView {
    func fadeIn(duration: NSTimeInterval = 0.5, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)  }
    
    func fadeOut(duration: NSTimeInterval = 0.5, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}

extension UIViewController {
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
