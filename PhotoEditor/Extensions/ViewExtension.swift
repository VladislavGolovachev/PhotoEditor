//
//  ViewExtension.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

//MARK: Modifiers
extension View {
    func capsuleButtonStyle(color: Color) -> some View {
        modifier(CapsuleButtonModifier(color: color))
    }
    
    func fieldStyle() -> some View {
        modifier(FieldModifier())
    }
    
    func commonTextStyle() -> some View {
        modifier(CommonTextModifier())
    }
    
    func secondaryTextStyle() -> some View {
        modifier(SecondaryTextModifier())
    }
    
    func barButtonStyle() -> some View {
        modifier(BarButtonModifier())
    }
}
