//
//  Book.swift
//  Kindle
//
//  Created by Luiz Hammerli on 06/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import Foundation

class Book {
    let name: String
    let author: String
    var pages: [Page]
    let image: String
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["title"] as? String ?? ""
        self.author = dictionary["author"] as? String ?? ""
        self.image = dictionary["coverImageUrl"] as? String ?? ""
        self.pages = [Page]()
        
        guard let pagesDictionary = dictionary["pages"] as? [[String:Any]] else{return}
        
        for pageDic in pagesDictionary{
            let page = Page(dictionary: pageDic)
            self.pages.append(page)
        }
    }
}
