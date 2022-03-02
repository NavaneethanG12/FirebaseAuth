//
//  AppDelegate.swift
//  FirebaseAuth
//
//  Created by navaneeth-pt4855 on 01/03/22.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loggedInOrNot: Int = 0
    var vc: UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        loggedInOrNot = UserDefaults.standard.integer(forKey: "userlogin")
    
        
        
        if loggedInOrNot == 1{
            vc = ViewController()
        }else if loggedInOrNot == 0{
            vc = EntryViewController()
        }
    
        let navVc = UINavigationController(rootViewController: vc!)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navVc
        
        
        return true
    }

}

