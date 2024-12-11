//
//  RegistView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct RegistView: View {
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
            
            SecureField(Constants.Text.confirmPasswordPlaceholder, text: $passwordString)
                .modifier(FieldModifier())
            
            Button(Constants.Text.signUpButton) {
                print("Sign up")
            }
            .modifier(CommonButtonModifier(color: .green))
        }
        .padding()
        
        Spacer()
    }
}

extension RegistView {
    private enum Constants {
        enum Text {
            static let title                        = "Sign up"
            static let loginPlaceholder             = "Email"
            static let passwordPlaceholder          = "Password"
            static let confirmPasswordPlaceholder   = "Confirm password"
            static let signUpButton                 = "Sign up"
        }
    }
}

#Preview {
    RegistView()
}
