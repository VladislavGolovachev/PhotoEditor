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
        }
    }
}
