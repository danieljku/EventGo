//
//  ServerHelper.swift
//  EventGo
//
//  Created by Nicholas Swift on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import Foundation

class ServerHelper {
    
    static func retreiveEvents() {
        
        // Set up the request
        let apiURL = NSURL(string: "STRINGHEREPLEASE")
        let request = NSURLRequest(URL: apiURL!)
        
        // Create a task
        let task = NSURLSession.sharedSession().dataTaskWithURL(request.URL!) {
            (data, response, error) in
            
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
                
                    for each in dictionary as! [[String: String]] {
                        print(each["userid"]!)
                    }
                }
            }
        }
    }
    
    static func attemptLogin(email: String!, password: String!) -> Bool {
        
        var loggedIn = false
        
        // If there's nothing in email or password, just return false, no need to check
        if email == nil || email == "" || password == nil || password == "" {
            return false
        }
        
        // Set up the request
        let apiURL = NSURL(string: "http://curtastic.com/eventtogo/?action=login&email=" + email + "&password=" + password)
        let request = NSURLRequest(URL: apiURL!)
        
        // Create a task
        let task = NSURLSession.sharedSession().dataTaskWithURL(request.URL!) {
            
            (data, response, error) in
            
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
                
                if let dictionary = parsedResult["user"] {
                    print(dictionary)
                
                    for each in dictionary as! [[String: String]] {
                        print(each["email"]!)
                    }
                    
                    loggedIn = true
                }
            }
        }
        
        task.resume()
        
        return loggedIn
    }
}