//
//  ViewExtension.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

//MARK: Modifiers
extension View {
    func textBoxStyle(textBox: TextBox) -> some View {
        modifier(TextBoxModifier(textBox: textBox))
    }
    
    func capsuleButtonStyle(color: Color) -> some View {
        modifier(CapsuleButtonModifier(color: color))
    }
    
    func fieldStyle() -> some View {
        modifier(FieldModifier())
    }
    
    func commonTextStyle(opacity: CGFloat = 1,
                         color: Color = .black) -> some View {
        modifier(TextModifier(opacity: opacity, color: color))
    }
    
    func secondaryTextStyle() -> some View {
        modifier(TextModifier(opacity: 0.6, color: .gray))
    }
    
    func barButtonStyle(color: Color = .blue) -> some View {
        modifier(BarButtonModifier(color: color))
    }
}
