//
//  LightNavigationController.swift
//  Kindle
//
//  Created by Luiz Hammerli on 04/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class LightNavigationBarController: UINavigationController, SideMenuDelegate {

    
    lazy var sideMenuView: SideMenuView = {
        let view = SideMenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    var leftAnchor:NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSideMenu()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setUpSideMenu(){
        self.view.insertSubview(sideMenuView, aboveSubview: self.navigationBar)
        self.sideMenuView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.sideMenuView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        leftAnchor = self.sideMenuView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -self.view.frame.width)
        leftAnchor?.isActive = true
        self.sideMenuView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
    }
    
   @objc func showSideMenu(){
        leftAnchor?.isActive = false
        leftAnchor?.constant = 0
        leftAnchor?.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            
        }, completion: { (success) in
            self.sideMenuView.showBackgroundView(0.2)
        })
    }
    
    func hideSideMenuView() {
        leftAnchor?.isActive = false
        leftAnchor?.constant = -self.view.frame.height
        leftAnchor?.isActive = true
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            
        }, completion: { (success) in
            self.sideMenuView.showBackgroundView(0)
        })
    }
}
