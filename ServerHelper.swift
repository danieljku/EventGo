//
//  ServerHelper.swift
//  EventGo
//
//  Created by Nicholas Swift on 6/25/16.
//  Copyright © 2016 djku. All rights reserved.
//

import Foundation

class ServerHelper {
    
    static var loading = false
    
    // For attempLogIn
    static var userLoggedIn: Bool!
    
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
        
        task.resume()
    }
    
    // Try to log in
    static func attemptLogIn(email: String!, password: String!) {
        
        loading = true
        
        // If there's nothing in email or password, just return false, no need to check
        if email == nil || email == "" || password == nil || password == "" {
            loading = false
            userLoggedIn = false
            return
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
                    
                    userLoggedIn = true
                    loading = false
                    
                    return
                }
            }
        }
        
        task.resume()
        return
    }
}