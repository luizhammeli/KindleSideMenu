//
//  SideMenuHeaderSectionView.swift
//  Kindle
//
//  Created by Luiz Hammerli on 05/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SideMenuHeaderSectionView: UIView {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Books"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.addSubview(titleLabel)
        self.addSubview(separator)
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
//        label.frame = CGRect(x: 14, y: 21, width: 100, height: 16)
        
        separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
    }
    
}
