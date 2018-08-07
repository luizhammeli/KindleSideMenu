//
//  navigationController+Layout.swift
//  Kindle
//
//  Created by Luiz Hammerli on 05/08/2018.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

extension UINavigationBar{
    func SetupViews(){
        barTintColor = UIColor.navBarBlack
        isTranslucent = false
        titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 22)]
        tintColor = .lightGray
    }
}
