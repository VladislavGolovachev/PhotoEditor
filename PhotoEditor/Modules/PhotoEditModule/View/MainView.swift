//
//  MainView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: EditingViewModel
    
    var body: some View {
        ZStack {
            if let image = viewModel.selectedImage {
                if viewModel.mode == .drawing {
                    DrawingView()
                } else {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                }
                if viewModel.addNewBox {
                    TextField("Text", text: $viewModel.textBoxes[viewModel.currentIndex].text)
                        .font(.system(size: 24))
                        .colorScheme(.dark)
                        .padding()
                }
            } else {
                Text("Add a photo, before start working")
                    .modifier(SecondaryTextModifier())
            }
        }
    }
}
