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
        let errorGreenColor = UIColor(red: 141/255, green: 241/255, blue: 50/255, alpha: 255/255)
        
        // Start fade out
        self.errorLabel.fadeOut(completion: {
            (finished: Bool) -> Void in
            
            // Check username and password
            if let user = self.usernameField.text {
                if let pass = self.passwordField.text {
                    if user == "user" && pass == "pass" {
                        self.errorLabel.textColor = errorGreenColor
                        self.errorLabel.text = "Successfully logged in."
                    }
                    else {
                        self.errorLabel.textColor = errorRedColor
                        self.errorLabel.text = "The username or password is incorrect."
                    }
                }
            }
            
            // Start fade in
            self.errorLabel.fadeIn()
        })
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        
    }
    
    let apiURL = NSURL(string: "http://curtastic.com/eventtogo/?action=getevents")!
    
    /*let request = NSURLRequest(URL: apiURL)
    
    
    // Create a task
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
        (data, reponse, error) in
        
        if error == nil {
            
            guard let data = data else {
                
                print("No data was returned by the request!")
                return
            }
            let parsedResult: AnyObject!
            
            do {
                // Serialize means converting object to streams of bytes
                print(data)
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                
                print(parsedResult)
            } catch {
                print("Coult not parse the data as JSON: '\(data)'")
                return
            }
            if let dictionary = parsedResult["events"] {
                print(dictionary)
                
                for each in dictionary as! [[String: String]] {
                    print(each["userid"]!)
                }
            }
        }
    }*/
    
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
