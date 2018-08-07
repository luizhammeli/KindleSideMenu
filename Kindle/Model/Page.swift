//
//  Models.swift
//  Kindle
//
//  Created by Mac on 10/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

class Page{
    let number: Int
    let text: String
    
    init(dictionary: [String: Any]) {
        self.number = dictionary["id"] as! Int
        self.text = dictionary["text"] as! String
    }
}


