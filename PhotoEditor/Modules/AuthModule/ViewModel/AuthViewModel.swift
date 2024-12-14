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
    @Published var errorCaused = false
    @Published var errorMessage = String()
    @Published var isLoggedIn = false
    
    func checkInputValidity() {
        if emailString.isEmpty || passwordString.isEmpty {
            errorMessage = ValidationError.emptyFields.rawValue
            errorCaused = true
            return
        }
        if !emailString.hasSuffix("@mail.ru") && !emailString.hasSuffix("@gmail.com") {
            errorMessage = ValidationError.emailNotValid.rawValue
            errorCaused = true
            return
        }
        if passwordString.count < 5 {
            errorMessage = ValidationError.passwordNotLong.rawValue
            errorCaused = true
            return
        }
        
        isLoggedIn = true
    }
}
