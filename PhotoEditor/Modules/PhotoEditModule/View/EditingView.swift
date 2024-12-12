//
//  EditingView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI
import CoreImage
import PencilKit
import PhotosUI

struct EditingView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var pickerItem: ImagePicker?
    @State private var selectedImage: UIImage?
    @State private var source: Picker.Source?
    @State private var showPicker = false
    @State private var showDialog = false
    
    var body: some View {
        NavigationView {
            Group {
                if let selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
                } else {
                    Text("Add a photo, before start working")
                        .font(.system(size: GlobalConstants.commonTextSize))
                        .opacity(0.4)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Sign out")
                            .font(.system(size: 16))
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showDialog.toggle()
                    }
                    label: {
                        Image(systemName: "photo.badge.plus")
                            .font(.system(size: 16))
                    }
                    .disabled(selectedImage != nil)
                    .confirmationDialog("Choose a way to add a photo",
                                        isPresented: $showDialog,
                                        titleVisibility: .visible) {
                        Button {
                            source = .library
                            showPicker.toggle()
                        } label: {
                            Text("Gallery")
                        }
                        
                        Button {
                            source = .camera
                        } label: {
                            Text("Camera")
                        }
                    }
                    .sheet(item: $source) { source in
                        switch source {
                        case .library:
                            ImagePicker(sourceType: .photoLibrary,
                                        selectedImage: $selectedImage)
                        case .camera:
                            ImagePicker(sourceType: .camera,
                                        selectedImage: $selectedImage)
                        }
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 16))
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.system(size: 16))
                    }
                    
                    Spacer()
                    
                    Button {
                        selectedImage = nil
                    } label: {
                        Image(systemName: "trash")
                            .font(.system(size: 16))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EditingView()
}
