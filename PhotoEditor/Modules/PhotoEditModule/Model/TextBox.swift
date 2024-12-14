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
    var font = "Arial"
    var size: CGFloat = GlobalConstants.commonTextSize
    var isBold = false
    var textColor: Color = .white
    
    var location: CGPoint = CGPoint(x: 200, y: 300)
    var offset: CGSize = .zero
}
