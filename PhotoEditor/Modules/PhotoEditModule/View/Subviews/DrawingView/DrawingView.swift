//
//  DrawingView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI
import PencilKit

struct DrawingView: View {
    @EnvironmentObject var viewModel: EditingViewModel
    
    var body: some View {
        ZStack {
            GeometryReader { proxy -> AnyView in
                let size = proxy.size
                DispatchQueue.main.async {
                    if viewModel.imageSize == .zero {
                        viewModel.imageSize = proxy.size
                    }
                }
                
                return AnyView(
                    ZStack {
                        CanvasView(size: size)
                        TextBoxesView()
                    }
                )
            }
            
            if viewModel.isNewTextBoxBeingAdded {
                AddingTextView()
                    .navigationBarHidden(true)
                    .onDisappear {
                        viewModel.showToolPicker()
                    }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    viewModel.cancelAppliedDrawing()
                    viewModel.mode = .editing
                }
                .barButtonStyle()
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    viewModel.hideToolPicker()
                    viewModel.appendTextBox()
                    
                    withAnimation {
                        viewModel.isNewTextBoxBeingAdded.toggle()
                    }
                } label: {
                    Image(systemName: "character.textbox")
                }
                .barButtonStyle()
                
                Button("**Done**") {
                    viewModel.saveDrawing()
                    viewModel.mode = .editing
                }
                .barButtonStyle()
            }
        }
    }
}
