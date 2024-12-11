//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 11.12.2024.
//

import SwiftUI

struct AuthView: View {
    @State var loginString = String()
    @State var passwordString = String()
    
    var body: some View {
        VStack(spacing: GlobalConstants.verticalSpacing) {
            Label(Constants.Text.title, image: "")
                .font(.largeTitle)
            
            TextField(Constants.Text.loginPlaceholder, text: $loginString)
                .modifier(FieldModifier())
            
            SecureField(Constants.Text.passwordPlaceholder, text: $passwordString)
                .modifier(FieldModifier())
            
            HStack {
                Button(Constants.Text.signUpButton) {
                    RegistView()
                }
                .font(.callout)
                
                Spacer()
                
                Button((Constants.Text.helpButton)) {
                    print("Forgot email")
                }
                .font(.callout)
            }
            
            Button(Constants.Text.signInButton) {
                print("Sign in")
            }
            .modifier(CommonButtonModifier(color: .blue))
            
            Label(Constants.Text.supportingLabel, image: "")
                .font(.system(size: GlobalConstants.commonTextSize))
                .opacity(0.5)
            
            Button {
                print("Google")
            } label: {
                GoogleLogo()
            }
        }
        .padding()
        
        Spacer()
    }
}

extension AuthView {
    private enum Constants {
        enum Text {
            static let title                = "Sign in"
            static let loginPlaceholder     = "Email"
            static let passwordPlaceholder  = "Password"
            static let signUpButton         = "Sign up"
            static let helpButton           = "Forgot email?"
            static let signInButton         = "Sign in"
            static let supportingLabel      = "Or continue with"
        }
    }
}

#Preview {
    AuthView()
}
