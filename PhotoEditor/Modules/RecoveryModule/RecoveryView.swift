//
//  RecoveryView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct RecoveryView: View {
    @State var emailString = String()
    @State var isPresentedAlert = false
    
    var body: some View {
        VStack(spacing: GlobalConstants.verticalSpacing) {
            HStack {
                Text(TextConstants.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack() {
                Text(TextConstants.description)
                    .font(.title3)
                Spacer()
            }
            
            TextField(TextConstants.emailPlaceholder, text: $emailString)
                .modifier(FieldModifier())
            
            Button(TextConstants.nextButton) {
                isPresentedAlert = true
            }
            .modifier(CommonButtonModifier(color: .blue))
            .alert(TextConstants.Alert.title, isPresented: $isPresentedAlert, actions: {
                Button(TextConstants.Alert.button,
                       role: .cancel) {
                    //FIXME: Dismiss the current view
                }
            }, message: {
                Text(TextConstants.Alert.message)
            })
        }
        .padding()
        
        Spacer()
    }
}

extension RecoveryView {
    private enum TextConstants {
        static let title            = "Account's recovery"
        static let description      = "Enter your email"
        static let emailPlaceholder = "Email"
        static let nextButton       = "Next"
        
        enum Alert {
            static let title        = "Success!"
            static let button   = "Okay"
            static let message      =
        """
        The message was sent to your email. 
        Follow instructions.
        """
        }
    }
}

#Preview {
    RecoveryView()
}
