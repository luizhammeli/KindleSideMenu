//
//  booksListViewController+TableVIew.swift
//  Kindle
//
//  Created by Luiz Hammerli on 06/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

extension BooksListViewController{
    
    func setUpTableViewConstraints(){
        self.view.addSubview(tableView)
        
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BookCell
        cell.book = books[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let pageViewControler = PageViewController(collectionViewLayout: layout)
        pageViewControler.book = books[indexPath.item]
        self.tableView.deselectRow(at: indexPath, animated: true)
        self.present(UINavigationController(rootViewController: pageViewControler), animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return CustomFooterView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
}
