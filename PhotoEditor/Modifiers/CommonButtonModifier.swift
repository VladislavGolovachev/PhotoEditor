//
//  CommonButtonModifier.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct CommonButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(Constants.paddingEdgeInsets)
            .background(.blue)
            .tint(.white)
            .clipShape(.capsule)
            .font(.system(size: Constants.buttonFontSize))
    }
}

extension CommonButtonModifier {
    private enum Constants {
        static let paddingEdgeInsets = EdgeInsets(top: 10,
                                                  leading: 40,
                                                  bottom: 10,
                                                  trailing: 40)
        static let buttonFontSize: CGFloat = 18
    }
}
