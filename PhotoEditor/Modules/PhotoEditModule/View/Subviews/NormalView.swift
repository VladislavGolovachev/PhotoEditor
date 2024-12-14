//
//  NormalView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

struct NormalView: View {
    @EnvironmentObject var viewModel: EditingViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Image(uiImage: viewModel.selectedImage ?? UIImage())
            .resizable()
            .scaledToFit()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Sign out") {
                        dismiss()
                    }
                    .barButtonStyle()
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        viewModel.mode = .editing
                    }
                    label: {
                        Image(systemName: "slider.horizontal.3")
                            .barButtonStyle()
                    }
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        viewModel.showShare.toggle()
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                            .barButtonStyle()
                    }
                    
                    Spacer()
                    
                    Button {
                        viewModel.nullifyImage()
                    } label: {
                        Image(systemName: "trash")
                            .barButtonStyle()
                    }
                }
            }
            .sheet(isPresented: $viewModel.showShare) {
                if let image = viewModel.selectedImage {
                    ActivityView(activityItems: [image])
                }
            }
    }
}
