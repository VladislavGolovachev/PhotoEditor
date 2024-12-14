//
//  AuthViewModel.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI

final class AuthViewModel: ObservableObject {
    @Published var emailString = String()
    @Published var passwordString = String()
    @Published var isRecoveryScreenPresented = false
    
    
}
