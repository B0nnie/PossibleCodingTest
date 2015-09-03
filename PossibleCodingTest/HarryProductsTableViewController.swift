//
//  HarryProductsTableViewController.swift
//  PossibleCodingTest
//
//  Created by Ebony Nyenya on 8/14/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import UIKit

class HarryProductsTableViewController: UITableViewController {
    
    var harryArray = [HarryProduct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HarryAPI.sharedInstance.loadDataFromAPI({(result, error) -> Void in
            
            if let result = result as? [[String : String]] {
                self.harryArray = HarryProduct.productsFromResults(result)
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return harryArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as? UITableViewCell
        
        //get a HarryProduct dictionary
        var productDictionary = harryArray[indexPath.row]
        
        
        if let author = productDictionary.author {
            
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
                reuseIdentifier: "cell")
            
            cell!.detailTextLabel!.text = author
            
        } else {
            cell = UITableViewCell(style: UITableViewCellStyle.Default,
                reuseIdentifier: "cell")
        }
        
        //get a title from the dictionary and put in cell label
        if let title = productDictionary.title {
            cell!.textLabel!.text = title }
        
        if let imageUrlString = productDictionary.image {
            
            cell!.imageView!.image =
                NSURL(string: imageUrlString)
                    .flatMap { NSData(contentsOfURL: $0) }
                    .flatMap { UIImage(data: $0) }
            
        }
        return cell!
    }
    
}
