//
//  TextBoxesView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI

struct TextBoxesView: View {
    @EnvironmentObject var viewModel: EditingViewModel
    
    var body: some View {
        ForEach(viewModel.textBoxes) { box in
            Text(box.text)
                .textBoxStyle(textBox: box)
                .position(box.location)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation {
                                viewModel.dragOnChanged(box: box, location: value.location)
                            }
                        }
                        .onEnded({ value in
                            viewModel.dragOnEnded(box: box, location: value.location)
                        })
                )
        }
    }
}
