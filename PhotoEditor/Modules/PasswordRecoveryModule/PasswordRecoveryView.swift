//
//  PasswordRecoveryView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct PasswordRecoveryView: View {
    @State var emailString = String()
    @State var isPresentedAlert = false
    
    var body: some View {
        VStack(spacing: GlobalConstants.verticalSpacing) {
            Label(Constants.title, image: "")
                .font(.largeTitle)
            
            HStack() {
                Label(Constants.description, image: "")
                    .font(.title3)
                
                Spacer()
            }
            
            TextField(Constants.emailPlaceholder, text: $emailString)
                .modifier(FieldModifier())
            
            Button(Constants.nextButton) {
                isPresentedAlert = true
            }
            .modifier(CommonButtonModifier(color: .blue))
            .alert(Constants.Alert.title, isPresented: $isPresentedAlert, actions: {
                Button(Constants.Alert.buttonText,
                       role: .cancel) {
                    //FIXME: Dismiss the current view
                }
            }, message: {
                Text(Constants.Alert.message)
            })
        }
        .padding()
        
        Spacer()
    }
}

extension PasswordRecoveryView {
    private enum Constants {
        static let title            = "Account's recovery"
        static let description      = "Enter your email"
        static let emailPlaceholder = "Email"
        static let nextButton       = "Next"
        
        enum Alert {
            static let title        = "Success!"
            static let buttonText   = "Okay"
            static let message      =
        """
        The message was sent to your email. 
        Follow instructions.
        """
        }
    }
}

#Preview {
    PasswordRecoveryView()
}
