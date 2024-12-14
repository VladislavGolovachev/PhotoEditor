//
//  RecoveryView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct RecoveryView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = RecoveryViewModel()
    
    var body: some View {
        VStack(spacing: GlobalConstants.verticalSpacing) {
            TitleView(text: TextConstants.title)
            
            HStack() {
                Text(TextConstants.description)
                    .font(.title3)
                Spacer()
            }
            
            TextField(TextConstants.emailPlaceholder, text: $viewModel.emailString)
                .modifier(FieldModifier())
            
            Button(TextConstants.nextButton) {
                viewModel.signUp()
            }
            .capsuleButtonStyle(color: .blue)
            
        }
        .alert(TextConstants.Alert.title,
               isPresented: $viewModel.messageSentSuccessfuly,
               actions: {
            Button(TextConstants.Alert.button, role: .cancel) {
                dismiss()
            }
        }, message: {
            Text(TextConstants.Alert.message)
        })
        .alert("Error caused",
                 isPresented: $viewModel.errorCaused,
                 actions: {
              Button("Okay") {}
                  .commonTextStyle()
          }, message: {
              Text(viewModel.errorMessage)
          })
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
