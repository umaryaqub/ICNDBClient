//
//  AppDelegate.swift
//  ICNDBClient
//
//  Created by Umar Yaqub on 20/12/2018.
//  Copyright © 2018 Umar Yaqub. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = ICNDBController()
        window?.makeKeyAndVisible()
        return true
    }
}

