//
//  MainView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI
import CoreImage
import PencilKit
import PhotosUI

struct MainView: View {
    @StateObject var viewModel = EditingViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            if viewModel.isImageEmpty() {
                InitialView()
            } else {
                switch viewModel.mode {
                case .normal:
                    NormalView()
                    
                case .editing:
                    EditingView()
                    
                case .drawing:
                    DrawingView()
                }
            }
        }
        .environmentObject(viewModel)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    EditingView()
}
