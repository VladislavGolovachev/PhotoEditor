//
//  TopRightButton.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

struct TopRightButton: View {
    @EnvironmentObject var viewModel: EditingViewModel
    
    var body: some View {
        Button {
            if viewModel.isImageEmpty() {
                viewModel.showDialog.toggle()
                return
            }
            switch viewModel.mode {
            case .normal, .drawing:
                viewModel.mode = .editing
                
            case .editing:
                viewModel.mode = .normal
            }
        }
        label: {
            if viewModel.isImageEmpty() {
                Image(systemName: "photo.badge.plus")
                    .font(.system(size: GlobalConstants.barButtonSize))
            } else {
                switch viewModel.mode {
                case .normal:
                    Image(systemName: "slider.horizontal.3")
                        .font(.system(size: GlobalConstants.barButtonSize))
                    
                case .editing:
                    Text("Save")
                        .font(.system(size: GlobalConstants.barButtonSize))
                    
                case .drawing:
                    Text("Done")
                        .font(.system(size: GlobalConstants.barButtonSize))
                }
            }
        }
        .confirmationDialog("Choose a way to add a photo",
                            isPresented: $viewModel.showDialog,
                            titleVisibility: .visible) {
            Button {
                viewModel.source = .library
            } label: {
                Text("Gallery")
            }
            
            Button {
                viewModel.source = .camera
            } label: {
                Text("Camera")
            }
        }
        .sheet(item: $viewModel.source) { source in
            switch source {
            case .library:
                ImagePicker(sourceType: .photoLibrary,
                            selectedImage: $viewModel.selectedImage)
            case .camera:
                ImagePicker(sourceType: .camera,
                            selectedImage: $viewModel.selectedImage)
            }
        }
    }
}
