//
//  AppViewSwitcher.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI

struct AppViewSwitcher: View {
    @EnvironmentObject var model: AuthViewModel
    
    var body: some View {
        if model.isLoggedIn {
            MainView()
        } else {
            AuthView()
        }
    }
}
