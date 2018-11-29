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
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        view.alpha = 0
        return view
    }()
    
    var startSideMenuPanGesture = false
    
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
        
        self.view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    @objc func showSideMenu(){
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController as? BaseViewController else {return}
        rootViewController.showSideMenu()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
