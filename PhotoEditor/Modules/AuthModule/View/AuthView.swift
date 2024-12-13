//
//  AuthView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 11.12.2024.
//

import SwiftUI

struct AuthView: View {
    @State private var emailString = String()
    @State private var passwordString = String()
    @State private var isRecoveryScreenPresented = false
    
    var body: some View {
        NavigationView {
            ScrollView([]) {
                VStack(spacing: GlobalConstants.verticalSpacing) {
                    TitleView(text: TextConstants.title)
                    
                    TextField(TextConstants.loginPlaceholder, text: $emailString)
                        .modifier(FieldModifier())
                    
                    SecureField(TextConstants.passwordPlaceholder, text: $passwordString)
                        .modifier(FieldModifier())
                    
                    HStack {
                        NavigationLink {
                            SignUpView()
                        } label: {
                            Text(TextConstants.signUpButton)
                                .font(.callout)
                        }
                        
                        Spacer()
                        
                        Button((TextConstants.forgotEmail)) {
                            isRecoveryScreenPresented.toggle()
                        }
                        .font(.callout)
                        .sheet(isPresented: $isRecoveryScreenPresented) {
                            RecoveryView()
                        }
                    }
                    
                    NavigationLink {
                        EditingView()
                    } label: {
                        Text(TextConstants.signUpButton)
                    }
                    .modifier(CommonButtonModifier(color: .blue))
                    
                    Text(TextConstants.supportingText)
                        .modifier(SecondaryTextModifier())
                    
                    NavigationLink {
                        Text("Google")
                    } label: {
                        GoogleLogo()
                    }
                }
                .padding()
                
                Spacer()
            }
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
