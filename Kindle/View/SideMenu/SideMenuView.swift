//
//  SideMenuView.swift
//  Kindle
//
//  Created by Luiz Hammerli on 04/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SideMenuView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let items: [[SideMenuItem]] = [[SideMenuItem(title: "Search", subTitle: "", image: #imageLiteral(resourceName: "search")),SideMenuItem(title: "Discover", subTitle: "", image: #imageLiteral(resourceName: "list")),
        SideMenuItem(title: "Sync", subTitle: "Last synced on 07/20/2018", image: #imageLiteral(resourceName: "sync"))],[SideMenuItem(title: "Docs", subTitle: "", image: nil), SideMenuItem(title: "Newsstand", subTitle: "", image: nil), SideMenuItem(title: "Collections", subTitle: "", image: nil), SideMenuItem(title: "Help", subTitle: "", image: nil), SideMenuItem(title: "Settings", subTitle: "", image: #imageLiteral(resourceName: "config"))]]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.black
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    let cellID = "cellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        setUpTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
