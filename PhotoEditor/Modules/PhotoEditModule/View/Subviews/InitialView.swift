//
//  InitialView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

struct InitialView: View {
    @EnvironmentObject var viewModel: EditingViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("Add a photo, before start working")
            .secondaryTextStyle()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showDialog.toggle()
                    }
                    label: {
                        Image(systemName: "photo.badge.plus")
                    }
                    .barButtonStyle()
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
    }
}
