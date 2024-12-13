//
//  AuthViewModel.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI
import FirebaseAuth

final class AuthViewModel: ObservableObject {
    @Published var emailString = String()
    @Published var passwordString = String()
    @Published var isRecoveryScreenPresented = false
    @Published var errorCaused = false
    @Published var errorMessage = String()
    @Published var isLoggedIn = false
    
    func signIn() {
        if !checkInputValidity() {
            return
        }
        
        Auth.auth().signIn(withEmail: emailString,
                           password: passwordString) { [weak self] (result, error) in
            if let error {
                self?.errorMessage = error.localizedDescription
                self?.errorCaused = true
            } else {
                self?.isLoggedIn = true
            }
        }
    }
    
    func signInGoogle() {
        if !checkInputValidity() {
            return
        }
    }
}

extension AuthViewModel {
    private func checkInputValidity() -> Bool {
        if emailString.isEmpty || passwordString.isEmpty {
            errorMessage = ValidationError.emptyFields.rawValue
            errorCaused = true
            return false
        }
        if !emailString.hasSuffix("@mail.ru") && !emailString.hasSuffix("@gmail.com") {
            errorMessage = ValidationError.emailNotValid.rawValue
            errorCaused = true
            return false
        }
        if passwordString.count < 6 {
            errorMessage = ValidationError.passwordNotLong.rawValue
            errorCaused = true
            return false
        }
        
        return true
    }
}
