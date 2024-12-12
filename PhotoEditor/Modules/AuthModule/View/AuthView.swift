//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 11.12.2024.
//

import SwiftUI

struct AuthView: View {
    @State var emailString = String()
    @State var passwordString = String()
    @State private var clickedButtonType: ButtonType?
    @State private var isRecoveryScreenPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: GlobalConstants.verticalSpacing) {
                TextField(TextConstants.loginPlaceholder, text: $emailString)
                    .modifier(FieldModifier())
                
                SecureField(TextConstants.passwordPlaceholder, text: $passwordString)
                    .modifier(FieldModifier())
                
                HStack {
                    Button(TextConstants.signUpButton) {
                        clickedButtonType = .signUp
                    }
                    .font(.callout)
                    
                    Spacer()
                    
                    Button((TextConstants.forgotEmail)) {
                        isRecoveryScreenPresented.toggle()
                    }
                    .font(.callout)
                    .sheet(isPresented: $isRecoveryScreenPresented) {
                        RecoveryView()
                    }
                }
                
                Button(TextConstants.signInButton) {
                    clickedButtonType = .signIn
                }
                .modifier(CommonButtonModifier(color: .blue))
                
                Text(TextConstants.supportingText)
                    .font(.system(size: GlobalConstants.commonTextSize))
                    .opacity(0.5)
                
                Button {
                    clickedButtonType = .google
                } label: {
                    GoogleLogo()
                }
            }
            .navigationTitle(TextConstants.title)
            .navigationDestination(item: $clickedButtonType, destination: { value in
                switch value {
                case .signIn:
                    Text("Photo Editing Screen")
                    
                case .signUp:
                    SignUpView()
                    
                case .google:
                    Text("Google Screen")
                }
            })
            .padding()
            
            Spacer()
        }
    }
}

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

#Preview {
    AuthView()
}
