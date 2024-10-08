//
//  FitnestXApp.swift
//  FitnestX
//
//  Created by Modamori Oluwayomi on 2024-07-09.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn


class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()

    return true
  }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var handled: Bool

        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        return false
    }
    
    

    

}


@main
struct FitnestXApp: App {
    @StateObject private var auth = RegistrationAuth.shared
    
    //Register app delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
                    .environmentObject(auth)
                    .onOpenURL(perform: { url in
                        GIDSignIn.sharedInstance.handle(url)
                    })
            }
        }
    }
}
