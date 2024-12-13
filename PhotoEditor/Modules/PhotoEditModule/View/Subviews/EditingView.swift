//
//  EditingView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

struct EditingView: View {
    @EnvironmentObject var viewModel: EditingViewModel
    
    var body: some View {
        Image(uiImage: viewModel.selectedImage ?? UIImage())
            .resizable()
            .scaledToFit()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        viewModel.mode = .normal
                    }
                    .barButtonStyle()
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        viewModel.mode = .drawing
                    } label: {
                        Image(systemName: "scribble.variable")
                    }
                    .barButtonStyle()
                    
                    Button("Save") {
                        viewModel.mode = .normal
                    }
                    .barButtonStyle()
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    HStack(spacing: 50) {
                        Button {
                            
                        } label: {
                            Image(systemName: "crop.rotate")
                        }
                        .barButtonStyle()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "camera.filters")
                        }
                        .barButtonStyle()
                        
                        Button {
                            viewModel.textBoxes.append(TextBox())
                            
                            withAnimation {
                                viewModel.addNewBox.toggle()
                            }
                        } label: {
                            Image(systemName: "character.textbox")
                        }
                        .barButtonStyle()
                    }
                    Spacer()
                }
            }
    }
}
