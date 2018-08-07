//
//  CustomFooterView.swift
//  Kindle
//
//  Created by Luiz Hammerli on 05/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit


class CustomFooterView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.navBarBlack
        
        let segmentedControl = UISegmentedControl(items: ["Cloud", "Device"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.tintColor = .white
        segmentedControl.selectedSegmentIndex = 0
        self.addSubview(segmentedControl)
        
        segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        segmentedControl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        segmentedControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        let gridButton = UIButton(type: .system)
        gridButton.setImage( #imageLiteral(resourceName: "grid"), for: .normal)
        gridButton.translatesAutoresizingMaskIntoConstraints = false
        gridButton.tintColor = UIColor.lightGray
        
        self.addSubview(gridButton)
        gridButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        gridButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        gridButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        gridButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let sortButton = UIButton(type: .system)
        sortButton.setImage( #imageLiteral(resourceName: "sort"), for: .normal)
        sortButton.translatesAutoresizingMaskIntoConstraints = false
        sortButton.tintColor = UIColor.lightGray
        
        self.addSubview(sortButton)
        sortButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        sortButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sortButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        sortButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
