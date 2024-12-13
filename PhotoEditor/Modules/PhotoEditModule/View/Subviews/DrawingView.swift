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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        viewModel.mode = .editing
                    }
                    .barButtonStyle()
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        viewModel.mode = .editing
                    } label: {
                        Image(systemName: "scribble.variable")
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
}
