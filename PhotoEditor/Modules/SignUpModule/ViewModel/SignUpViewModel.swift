//
//  SignUpViewModel.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI
import FirebaseAuth

final class SignUpViewModel: ObservableObject {
    @Published var emailString = String()
    @Published var passwordString1 = String()
    @Published var passwordString2 = String()
    @Published var errorMessage = String()
    @Published var errorCaused = false
    @Published var signUpSuccessful = false
    
    func signUp() {
        if !checkInputValidity() {
            return
        }
        Auth.auth().createUser(withEmail: emailString, password: passwordString1) { [weak self] (result, error) in
            if let error {
                self?.errorMessage = error.localizedDescription
                self?.errorCaused = true
            } else {
                Auth.auth().currentUser?.sendEmailVerification { error in
                    if let error {
                        self?.errorMessage = error.localizedDescription
                        self?.errorCaused = true
                    } else {
                        self?.signUpSuccessful.toggle()
                    }
                }
            }
        }
    }
}

extension SignUpViewModel {
    private func checkInputValidity() -> Bool {
        if emailString.isEmpty || passwordString1.isEmpty || passwordString2.isEmpty {
            errorMessage = ValidationError.emptyFields.rawValue
            errorCaused = true
            return false
        }
        if !emailString.hasSuffix("@mail.ru") && !emailString.hasSuffix("@gmail.com") {
            errorMessage = ValidationError.emailNotValid.rawValue
            errorCaused = true
            return false
        }
        if passwordString1.count < 6 || passwordString1 != passwordString2 {
            errorMessage = ValidationError.passwordNotLong.rawValue
            errorCaused = true
            return false
        }
        
        return true
    }
}
