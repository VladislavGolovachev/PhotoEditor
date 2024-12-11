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
        VStack(spacing: 25) {
            Label("Sign in", image: "")
                .font(.largeTitle)
            
            TextField("Your email", text: $loginString)
                .modifier(FieldModifier())
            
            SecureField("Your password", text: $passwordString)
                .modifier(FieldModifier())
            
            HStack {
                Button("Sign up") {
                    print("Sign up")
                }
                .font(.callout)
                
                Spacer()
                
                Button("Forgot email?") {
                    print("Forgot email")
                }
                .font(.callout)
            }
            
            Button("Sign in") {
                print("Sign in")
            }
            .frame(width: 120)
            .clipped()
            .modifier(CommonButtonModifier())
            
            Label("Or continue with", image: "")
                .font(.system(size: 18))
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

#Preview {
    AuthView()
}
