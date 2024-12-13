//
//  AddingTextView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI

struct AddingTextView: View {
    @EnvironmentObject var viewModel: EditingViewModel
    private var textBox: TextBox {
        viewModel.textBoxes[viewModel.currentIndex]
    }
    
    var body: some View {
        Color
            .black
            .opacity(0.75)
            .ignoresSafeArea()
        
        TextField("Text", text: $viewModel.textBoxes[viewModel.currentIndex].text)
            .font(
                Font(UIFont(name: textBox.font,
                            size: textBox.size)! as CTFont)
                .weight(textBox.isBold ? .bold : .regular)
            )
            .foregroundStyle(viewModel.textBoxes[viewModel.currentIndex].textColor)
            .multilineTextAlignment(.center)
            .colorScheme(.dark)
            .padding()
        
        HStack() {
            Button("Cancel") {
                withAnimation {
                    viewModel.cancelTextBox()
                }
            }
            .commonTextStyle(color: .white)
            
            Spacer()
            TextToolBar(textBox: $viewModel.textBoxes[viewModel.currentIndex])
            Spacer()
            
            Button("**Add**") {
                withAnimation {
                    viewModel.addTextBox()
                }
            }
            .commonTextStyle(color: .white)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        
        Spacer()
    }
}

#Preview {
    AddingTextView()
}
