//
//  CanvasView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @EnvironmentObject var viewModel: EditingViewModel
    var size: CGSize
    
    func makeUIView(context: Context) -> PKCanvasView {
        viewModel.canvas.drawingPolicy = .anyInput
        viewModel.canvas.isOpaque = false
        viewModel.canvas.backgroundColor = .clear
        
        if let image = viewModel.selectedImage {
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(origin: .zero, size: size)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            
            let subview = viewModel.canvas.subviews[0]
            subview.addSubview(imageView)
            subview.sendSubviewToBack(imageView)
            
            viewModel.toolPicker.setVisible(true, forFirstResponder: viewModel.canvas)
            viewModel.toolPicker.addObserver(viewModel.canvas)
            viewModel.canvas.becomeFirstResponder()
        }
        
        return viewModel.canvas
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}
