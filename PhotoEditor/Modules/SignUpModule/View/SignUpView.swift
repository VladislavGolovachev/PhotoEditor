//
//  SignUpView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: GlobalConstants.verticalSpacing) {
            TitleView(text: TextConstants.title)
            
            TextField(TextConstants.loginPlaceholder, text: $viewModel.emailString)
                .fieldStyle()
            
            SecureField(TextConstants.passwordPlaceholder, text: $viewModel.passwordString1)
                .fieldStyle()
            
            SecureField(TextConstants.confirmPasswordPlaceholder, text: $viewModel.passwordString2)
                .fieldStyle()
            
            Button(TextConstants.signUpButton) {
                viewModel.signUp()
                print("Sign up")
            }
            .capsuleButtonStyle(color: .green)
        }
        .padding()
        .alert("Success",
               isPresented: $viewModel.signUpSuccessful,
               actions: {
            Button("Okay") {
                dismiss()
            }
            .commonTextStyle()
        }, message: {
            Text("Registration is successful")
        })
        .alert("Error caused",
               isPresented: $viewModel.errorCaused,
               actions: {
            Button("Okay") {}
                .commonTextStyle()
        }, message: {
            Text(viewModel.errorMessage)
        })
        
        Spacer()
    }
}

extension SignUpView {
    private enum TextConstants {
        static let title                        = "Sign up"
        static let loginPlaceholder             = "Email"
        static let passwordPlaceholder          = "Password"
        static let confirmPasswordPlaceholder   = "Confirm password"
        static let signUpButton                 = "Sign up"
    }
}

#Preview {
    SignUpView()
}
