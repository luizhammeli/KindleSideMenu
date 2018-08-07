//
//  LightNavigationController+TableView.swift
//  Kindle
//
//  Created by Luiz Hammerli on 04/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

extension SideMenuView{
    
    func setUpTableView(){
        tableView.separatorStyle = .none
        self.tableView.register(SideMenuTableViewCell.self, forCellReuseIdentifier: cellID)
        self.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -90).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SideMenuTableViewCell
        cell.item = items[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 58
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SideMenuHeaderSectionView()
        return headerView
    }
}
