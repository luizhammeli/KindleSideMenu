//
//  ViewController.swift
//  Kindle
//
//  Created by Mac on 10/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class BooksListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var books = [Book]()
    let cellID = "cellID"

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(BookCell.self, forCellReuseIdentifier: cellID)
        self.view.backgroundColor = UIColor.navBarBlack
        setUpTableView()
        fetchData()
    }
    
    func setUpTableView(){
        setUpTableViewConstraints()
        self.navigationItem.title = "All Items"
        self.navigationController?.navigationBar.SetupViews()
        let menuBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(self.showSideMenu))
        self.navigationItem.leftBarButtonItem = menuBarButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon"), style: .plain, target: self, action: nil)
    }
    
    @objc func showSideMenu(){
        guard let navController = self.navigationController as? LightNavigationBarController else{return}
        navController.showSideMenu()
    }
    
    func fetchData(){
        ApiService.shared.fetchContent { (success, books) in
            DispatchQueue.main.async {
                if(success){
                    guard let bookList = books else {return}
                    self.books = bookList
                    self.tableView.reloadData()
                }
            }
        }
    }
}
