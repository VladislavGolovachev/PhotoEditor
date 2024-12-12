//
//  SignUpView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct SignUpView: View {
    @State var emailString = String()
    @State var passwordString = String()
    
    var body: some View {
        VStack(spacing: GlobalConstants.verticalSpacing) {
            TitleView(text: TextConstants.title)
            
            TextField(TextConstants.loginPlaceholder, text: $emailString)
                .modifier(FieldModifier())
            
            SecureField(TextConstants.passwordPlaceholder, text: $passwordString)
                .modifier(FieldModifier())
            
            SecureField(TextConstants.confirmPasswordPlaceholder, text: $passwordString)
                .modifier(FieldModifier())
            
            Button(TextConstants.signUpButton) {
                print("Sign up")
            }
            .modifier(CommonButtonModifier(color: .green))
        }
        .padding()
        
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
