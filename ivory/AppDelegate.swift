//
//  AppDelegate.swift
//  ivory
//
//  Created by Varun on 07/10/19.
//  Copyright © 2019 Varun. All rights reserved.
//

import UIKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        FirebaseApp.configure()
        window = UIWindow.init(frame: CGRect(x:0,y:0,width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height))
          self.window?.makeKeyAndVisible()
        let viewcontroller = ViewController.init(nibName: "ViewController", bundle: nil)
        self.window?.rootViewController = viewcontroller
    
        AppManager.shared.createreachbility()
    
        return true
    }

    
     func application(_ application: UIApplication,
              continue userActivity: NSUserActivity,
    restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool
    {
        
      
        
            return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        

        print(url)
        
     return true
    }


}

