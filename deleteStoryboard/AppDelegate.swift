//
//  AppDelegate.swift
//  deleteStoryboard
//
//  Created by 三浦　知明 on 2020/01/01.
//  Copyright © 2020 三浦　知明. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //セットアップ
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: ViewController(nibName: "ViewController", bundle: nil))
        self.window?.makeKeyAndVisible()
        return true
    }

}

