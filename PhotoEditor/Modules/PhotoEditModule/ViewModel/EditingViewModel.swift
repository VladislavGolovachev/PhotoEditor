//
//  ViewModel.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import Foundation
import PencilKit

final class EditingViewModel: ObservableObject {
    @Published var showDialog = false
    @Published var showShare = false
    @Published var mode: Mode = .normal
    
    @Published var selectedImage: UIImage?
    @Published var canvas = PKCanvasView()
    @Published var source: PickerType.Source?
    @Published var toolPicker = PKToolPicker()
    
    @Published var textBoxes: [TextBox] = []
    @Published var isNewTextBoxBeingAdded = false
    @Published var currentIndex = 0
    
    func isImageEmpty() -> Bool {
        return selectedImage == nil
    }
    
    func nullifyImage() {
        canvas = PKCanvasView()
        selectedImage = nil
    }
    
    func appendTextBox() {
        textBoxes.append(TextBox())
        currentIndex = textBoxes.count - 1
    }
    
    func cancelTextBox() {
        textBoxes.removeLast()
        isNewTextBoxBeingAdded = false
    }
    
    func addTextBox() {
        isNewTextBoxBeingAdded = false
    }
    
    func dragOnChanged(box: TextBox, location: CGPoint) {
        let index = draggableTextBoxIndex(of: box)
        if box.offset == .zero {
            textBoxes[index].offset = CGSize(width: box.location.x - location.x,
                                             height: box.location.y - location.y)
        }
        let offset = textBoxes[index].offset
        textBoxes[index].location = CGPoint(x: location.x + offset.width,
                                            y: location.y + offset.height)
    }
    
    func dragOnEnded(box: TextBox, location: CGPoint) {
        let index = draggableTextBoxIndex(of: box)
        let offset = textBoxes[index].offset
        
        textBoxes[index].location = CGPoint(x: location.x + offset.width,
                                            y: location.y + offset.height)
        textBoxes[index].offset = .zero
    }
    
    private func draggableTextBoxIndex(of box: TextBox) -> Int {
        let index = textBoxes.firstIndex { currentBox in
            currentBox.id == box.id
        }
        
        return index ?? 0
    }
}
