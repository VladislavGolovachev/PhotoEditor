//
//  AuthView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 11.12.2024.
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @ViewBuilder
    var body: some View {
        ScrollView([]) {
            VStack(spacing: GlobalConstants.verticalSpacing) {
                TitleView(text: TextConstants.title)
                
                TextField(TextConstants.loginPlaceholder, text: $viewModel.emailString)
                    .fieldStyle()
                    .textContentType(.emailAddress)
                    .submitLabel(.next)
                
                SecureField(TextConstants.passwordPlaceholder, text: $viewModel.passwordString)
                    .fieldStyle()
                    .textContentType(.password)
                    .submitLabel(.done)
                
                HStack {
                    NavigationLink {
                        SignUpView()
                    } label: {
                        Text(TextConstants.signUpButton)
                            .font(.callout)
                    }
                    
                    Spacer()
                    
                    Button(TextConstants.forgotEmail) {
                        viewModel.isRecoveryScreenPresented.toggle()
                    }
                    .font(.callout)
                    .sheet(isPresented: $viewModel.isRecoveryScreenPresented) {
                        RecoveryView()
                    }
                }
                
                Button(TextConstants.signInButton) {
                    viewModel.checkInputValidity()
                }
                .capsuleButtonStyle(color: .blue)
                
                Text(TextConstants.supportingText)
                    .secondaryTextStyle()
                
                NavigationLink {
                    Text("Google")
                } label: {
                    GoogleLogo()
                }
            }
            .padding()
            
            Spacer()
        }
        .alert("Error caused",
               isPresented: $viewModel.errorCaused,
               actions: {
            Button("Okay") {}
                .commonTextStyle()
        }, message: {
            Text(viewModel.errorMessage)
        })
    }
}

//MARK: Constants
extension AuthView {
    private enum TextConstants {
        static let title                    = "Sign in"
        static let loginPlaceholder         = "Email"
        static let passwordPlaceholder      = "Password"
        static let signUpButton             = "Sign up"
        static let forgotEmail              = "Forgot email?"
        static let signInButton             = "Sign in"
        static let supportingText           = "Or continue with"
    }
}
