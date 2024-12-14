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
                Button {
                    viewModel.mode = .drawing
                } label: {
                    Image(systemName: "scribble.variable")
                }
                .barButtonStyle(color: .gray)
            }
            ToolbarItem(placement: .topBarTrailing) {
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
                }
                Spacer()
            }
        }
    }
}
