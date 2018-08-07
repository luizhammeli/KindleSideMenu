//
//  ApiService.swift
//  Kindle
//
//  Created by Luiz Hammerli on 06/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ApiService{
    
    static let shared = ApiService()
    
    
    func fetchContent(_ handler: @escaping(_ success: Bool, _ books: [Book]?)->Void){
        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") else {return}
        var books = [Book]()
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error{
                print("Erro: \(error)")
                handler(false, nil)
                return
            }
            
            guard let data = data else {handler(false, nil); return}
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                guard let booksDic = json as? [[String: Any]] else{handler(false, nil); return}
                
                for bookDic in booksDic{
                    let book = Book(dictionary: bookDic)
                    books.append(book)
                }
                
                handler(true, books)
                
            }catch let err{
                print(err)
            }
            
        }).resume()
    }
}
