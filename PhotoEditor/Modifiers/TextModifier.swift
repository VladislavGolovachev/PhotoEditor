//
//  TextModifier.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

struct TextModifier: ViewModifier {
    let opacity: CGFloat
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: GlobalConstants.commonTextSize))
            .foregroundStyle(color)
            .opacity(opacity)
    }
}
