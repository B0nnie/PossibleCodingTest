//
//  HarryAPI.swift
//  PossibleCodingTest
//
//  Created by Ebony Nyenya on 8/14/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import Foundation

class HarryAPI {
    
    var session = NSURLSession.sharedSession()
    
    static let sharedInstance = HarryAPI()
    
    // getting the json data and then transforming it into a foundation object (your raw dicitonary)
    
    func loadDataFromAPI(completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
        
        // Build the URL and configure the request
        
        let urlString = HarryAPI.Constants.BaseURL
        
        let url = NSURL(string: urlString)!
        
        let request = NSURLRequest(URL: url)
        
        
        // Make the request
        
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, downloadError in
            
            //Parse the data and use it (happens in completion handler)
            if let error = downloadError {
            
                completionHandler(result: nil, error: error)
                
            } else {
                
                var parsingError: NSError?
                
                let result: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parsingError)
                
                if let error = parsingError {
                    completionHandler(result: nil, error: error)
                } else {
                    
                    // TASK ACCOMPLISHED!!! CALL THE COMPLETIONHANDLER
                    completionHandler(result: result!, error: nil)
                }
                
            }
        })
        
        //Start the request
        task.resume()
        
        return task
    }
    
   
}