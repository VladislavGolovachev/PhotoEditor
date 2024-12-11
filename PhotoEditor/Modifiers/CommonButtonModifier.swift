//
//  CommonButtonModifier.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct CommonButtonModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: Constants.width)
            .clipped()
            .background(color)
            .tint(.white)
            .clipShape(.capsule)
            .font(.system(size: GlobalConstants.commonTextSize))
    }
}

extension CommonButtonModifier {
    private enum Constants {
        static let width: CGFloat = 170
    }
}
