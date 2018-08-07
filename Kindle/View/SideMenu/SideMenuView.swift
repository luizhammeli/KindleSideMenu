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
    var delegate: SideMenuDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(hideSideMenu))
        self.addGestureRecognizer(panGesture)
        setUpTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func hideSideMenu(gesture: UIPanGestureRecognizer){
        if gesture.state == .changed{
            handleSwipeChanged(gesture)
        }else if gesture.state == .ended{
            handlePanEnded(gesture)
        }
    }
    
    func handleSwipeChanged(_ gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: self.superview)
        if(translation.x > 0){return}
        self.backgroundColor = UIColor.black.withAlphaComponent(-translation.y / 200)
        self.transform = CGAffineTransform(translationX: translation.x, y: 0)
    }
    
    func handlePanEnded(_ gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: self.superview)
        let velocity = gesture.velocity(in: self.superview)
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.transform = .identity
            if(translation.x < -200 || velocity.x < -500){
                self.delegate?.hideSideMenuView()
            }else{
                self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
            }
        }, completion: nil)
    }
    
    func showBackgroundView(_ alpha: CGFloat){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                self.backgroundColor = UIColor.black.withAlphaComponent(alpha)
        }, completion: nil)
    }
}
