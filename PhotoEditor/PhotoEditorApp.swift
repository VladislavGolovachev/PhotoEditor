//
//  PhotoEditorApp.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 11.12.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct PhotoEditorApp: App {
    @StateObject var model = AuthViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppViewSwitcher()
            }
            .environmentObject(model)
        }
    }
}
