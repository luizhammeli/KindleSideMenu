//
//  PageCell.swift
//  Kindle
//
//  Created by Luiz Hammerli on 24/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    let pageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL SOME TEXT FOR OUR LABEL"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpviews()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpviews(){
        self.addSubview(pageLabel)
        pageLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pageLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        pageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
}
