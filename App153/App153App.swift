//
//  App153App.swift
//  App153
//
//  Created by IGOR on 20/07/2023.
//

import SwiftUI
import OneSignal
import FirebaseCore
import ApphudSDK
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_gu9oz8r3VomMcv6bph54rK8xnHg9Tj")
        Amplitude.instance().initializeApiKey("c98aa0b1dc830ecbaa1f2fbc7beb1763")

        FirebaseApp.configure()
        
        return true
    }
}

@main
struct App153App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
