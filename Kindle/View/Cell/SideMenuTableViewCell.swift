//
//  SideMenuTableViewCell.swift
//  Kindle
//
//  Created by Luiz Hammerli on 04/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Discover"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "Last synced on 08/03/2018"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let sideImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = #imageLiteral(resourceName: "sync")
        return imageView
    }()
    
    var item:SideMenuItem?{
        didSet{
            titleLabel.text = item?.title
            subtitleLabel.text = item?.subTitle
            sideImageView.image = item?.image
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        self.addSubview(titleLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(separator)
        self.addSubview(sideImageView)
        
        sideImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -1).isActive = true
        sideImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -14).isActive = true
        sideImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        sideImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: sideImageView.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 14).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.sideImageView.leftAnchor, constant: -4).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        
        separator.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.8).isActive = true
    }
}
