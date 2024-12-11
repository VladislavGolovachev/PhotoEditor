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
        VStack(spacing: 35) {
            Label("Sign in", image: "")
                .font(.title)
            
            TextField("Your email", text: $loginString)
                .modifier(FieldModifier())
            
            VStack(spacing: 30) {
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
                .modifier(CommonButtonModifier())
            }
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    AuthView()
}
