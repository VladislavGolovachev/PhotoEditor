//
//  TextBoxModifier.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI

struct TextBoxModifier: ViewModifier {
    let textBox: TextBox
    
    func body(content: Content) -> some View {
        content
            .font(
                Font(UIFont(name: textBox.font,
                            size: textBox.size)! as CTFont)
                .weight(textBox.isBold ? .bold : .regular)
            )
            .foregroundStyle(textBox.textColor)
            .multilineTextAlignment(.center)
            .colorScheme(.dark)
            .padding()
    }
}
