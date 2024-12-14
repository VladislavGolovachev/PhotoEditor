//
//  RecoveryViewModel.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI
import FirebaseAuth

final class RecoveryViewModel: ObservableObject {
    @Published var emailString = String()
    @Published var errorMessage = String()
    @Published var errorCaused = false
    @Published var messageSentSuccessfuly = false
    
    func signUp() {
        if !checkInputValidity() {
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: emailString) { [weak self] error in
            if let error {
                self?.errorMessage = error.localizedDescription
                self?.errorCaused = true
            } else {
                self?.messageSentSuccessfuly.toggle()
            }
        }
    }
}

extension RecoveryViewModel {
    private func checkInputValidity() -> Bool {
        if emailString.isEmpty {
            errorMessage = ValidationError.emptyFields.rawValue
            errorCaused = true
            return false
        }
        if !emailString.hasSuffix("@mail.ru") && !emailString.hasSuffix("@gmail.com") {
            errorMessage = ValidationError.emailNotValid.rawValue
            errorCaused = true
            return false
        }
        
        return true
    }
}

