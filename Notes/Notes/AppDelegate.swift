//
//  AppDelegate.swift
//  Notes


import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let serverUrl = Bundle.main.object(forInfoDictionaryKey: "serverUrl") as? String
        print(serverUrl ?? "")
        /*
        var n = 100
        
        while true {
            print (n)
        }
        */
        return true
    }
}

