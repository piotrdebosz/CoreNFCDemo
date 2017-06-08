//
//  AppDelegate.swift
//  NFCDemo
//
//  Created by Piotr Dębosz on 07/06/2017.
//  Copyright © 2017 Applicator. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .black
        window?.makeKeyAndVisible()
        
        let mainViewController = MainViewController()
        
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        
        return true
    }
}

