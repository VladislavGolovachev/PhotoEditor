//
//  FieldModifier.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 11.12.2024.
//

import SwiftUI

struct FieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(
                .system(size: GlobalConstants.commonTextSize)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(Constants.fieldStrokeColor)
            )
    }
}

extension FieldModifier {
    private enum Constants {
        static let fieldStrokeColor = Color(red: 0.7, green: 0.7, blue: 0.7)
        static let cornerRadius: CGFloat = 6
    }
}
