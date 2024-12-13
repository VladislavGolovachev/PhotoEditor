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
}
