//
//  TextBox.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI
import PencilKit

struct TextBox: Identifiable {
    var id = UUID().uuidString
    
    var text = ""
    var font: Font = .body
    var size: CGSize = .zero
    var textColor: Color = .black
    var offset: CGSize = .zero
}
