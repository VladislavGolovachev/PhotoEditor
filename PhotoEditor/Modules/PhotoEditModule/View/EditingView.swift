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
    @StateObject var viewModel = EditingViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            NavigationView {
                MainView()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Text("Sign out")
                                    .font(.system(size: GlobalConstants.barButtonSize))
                            }
                        }
                        ToolbarItemGroup(placement: .topBarTrailing) {
                            Group {
                                if viewModel.mode != .normal {
                                    Button {
                                        if viewModel.mode == .editing {
                                            viewModel.mode = .drawing
                                        } else {
                                            viewModel.mode = .editing
                                        }
                                    } label: {
                                        Image(systemName: "scribble.variable")
                                            .font(.system(size: GlobalConstants.barButtonSize))
                                    }
                                }
                            }
                            TopRightButton()
                        }
                        ToolbarItemGroup(placement: .bottomBar) {
                            switch viewModel.mode {
                            case .editing:
                                Spacer()
                                HStack(spacing: 40) {
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "crop.rotate")
                                            .font(.system(size: GlobalConstants.barButtonSize))
                                    }
                                    
                                    Button {
                                        
                                    } label: {
                                        Image(systemName: "camera.filters")
                                            .font(.system(size: GlobalConstants.barButtonSize))
                                    }
                                    
                                    Button {
                                        viewModel.textBoxes.append(TextBox())
                                        
                                        withAnimation {
                                            viewModel.addNewBox.toggle()
                                        }
                                    } label: {
                                        Image(systemName: "character.textbox")
                                            .font(.system(size: GlobalConstants.barButtonSize))
                                    }
                                }
                                Spacer()
                                
                            case .drawing:
                                EmptyView()
                                
                            case .normal:
                                if !viewModel.isImageEmpty() {
                                    Button {
                                        viewModel.showShare.toggle()
                                    } label: {
                                        Image(systemName: "square.and.arrow.up")
                                            .font(.system(size: GlobalConstants.barButtonSize))
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        viewModel.nullifyImage()
                                    } label: {
                                        Image(systemName: "trash")
                                            .font(.system(size: GlobalConstants.barButtonSize))
                                    }
                                }
                            }
                        }
                    }
                    .sheet(isPresented: $viewModel.showShare) {
                        ActivityView(activityItems: [viewModel.selectedImage!])
                    }
            }
            .environmentObject(viewModel)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    EditingView()
}
