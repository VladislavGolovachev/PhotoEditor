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
                return AnyView(CanvasView(size: size))
            }
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
                    .onDisappear {
                        viewModel.showToolPicker()
                    }
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
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
                    viewModel.mode = .editing
                }
                .barButtonStyle()
            }
        }
    }
}
