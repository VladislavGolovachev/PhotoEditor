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
        ZStack {
            Image(uiImage: viewModel.selectedImage ?? UIImage())
                .resizable()
                .scaledToFit()
            ForEach(viewModel.textBoxes) { box in
                Text(box.text)
                    .textBoxStyle(textBox: box)
                    .position(box.location)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation {
                                    viewModel.dragOnChanged(box: box, location: value.location)
                                }
                            }
                            .onEnded({ value in
                                viewModel.dragOnEnded(box: box, location: value.location)
                            })
                    )
            }
            
            if viewModel.isNewTextBoxBeingAdded {
                AddingTextView()
                    .navigationBarHidden(true)
            }
        }
        .ignoresSafeArea(.keyboard)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Revert") {
                    viewModel.mode = .normal
                }
                .barButtonStyle(color: .red)
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    viewModel.mode = .drawing
                } label: {
                    Image(systemName: "scribble.variable")
                }
                .barButtonStyle(color: .gray)
                
                Button("**Save**") {
                    viewModel.mode = .normal
                }
                .barButtonStyle(color: .yellow)
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                HStack(spacing: 50) {
                    Button {
                        
                    } label: {
                        Image(systemName: "crop.rotate")
                    }
                    .barButtonStyle(color: .gray)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "camera.filters")
                    }
                    .barButtonStyle(color: .gray)
                    
                    Button {
                        viewModel.appendTextBox()
                        
                        withAnimation {
                            viewModel.isNewTextBoxBeingAdded.toggle()
                        }
                    } label: {
                        Image(systemName: "character.textbox")
                    }
                    .barButtonStyle(color: .gray)
                }
                Spacer()
            }
        }
    }
}
