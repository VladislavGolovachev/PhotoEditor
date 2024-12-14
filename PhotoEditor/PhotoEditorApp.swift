//
//  PhotoEditorApp.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 11.12.2024.
//

import SwiftUI

@main
struct PhotoEditorApp: App {
    @StateObject var model = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                AppViewSwitcher()
            }
            .environmentObject(model)
        }
    }
}
