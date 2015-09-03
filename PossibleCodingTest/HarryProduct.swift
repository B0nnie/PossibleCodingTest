//
//  HarryProduct.swift
//  PossibleCodingTest
//
//  Created by Ebony Nyenya on 8/15/15.
//  Copyright (c) 2015 Ebony Nyenya. All rights reserved.
//

import Foundation


class HarryProduct {
    
    var author : String?
    var title : String?
    var image : String?
    
    init(productDictionary: [String : String]) {
        
        self.title = productDictionary[HarryAPI.Constants.title] 
    
        self.author = productDictionary[HarryAPI.Constants.author]
        
        self.image = productDictionary[HarryAPI.Constants.imageURL]
        
    }
    
    class func productsFromResults(arrayOfDictionaries: [[String : String]]) -> [HarryProduct] {
        
        var products = [HarryProduct]()
        
        // for all the dictionaries in my array
        for product in arrayOfDictionaries {
            
            
            //add each initialized HarryProduct dictionary object to my array; transforming product into HarryProduct object and adding to array of HarryProducts
            products.append(HarryProduct(productDictionary: product))
            
        }
        
        
        return products
    }
    
    
    
    
}