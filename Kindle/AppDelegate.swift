//
//  AppDelegate.swift
//  Kindle
//
//  Created by Mac on 10/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool{
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = BaseViewController()
        
        UIApplication.shared.statusBarStyle = .lightContent
        return true
    }
}
