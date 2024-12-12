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
    @Environment(\.dismiss) var dismiss
    
//    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        Group {
            if let selectedImage {
                selectedImage
                .resizable()
                .scaledToFit()
            } else {
                Text("Before start working, you need to add a photo")
                    .font(.title)
                    .opacity(0.6)
                    .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Sign out")
                }
            }
//            ToolbarItem(placement: .topBarTrailing) {
//                PhotosPicker(selection: $pickerItem, matching: .images) {
//                    Image(systemName: "plus")
//                }
//                .onChange(of: pickerItem) {
//                    Task {
//                        selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
//                    }
//                }
//            }
        }
    }
}

#Preview {
    EditingView()
}
