//
//  AppDelegate.swift
//  EvensTaianStoneChallenge
//
//  Created by Evens Taian on 10/08/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootScene = CharactersFactory.makeModule()
        let navigation = UINavigationController(rootViewController: rootScene)
        
        let frame = UIScreen.main.bounds
        
        window = UIWindow(frame: frame)
        
        window!.rootViewController = navigation
        window!.makeKeyAndVisible()
        
        //TaskStore.makeCache()
        return true
    }


}

