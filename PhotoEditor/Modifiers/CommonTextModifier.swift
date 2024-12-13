//
//  CommonTextModifier.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

import SwiftUI

struct CommonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: GlobalConstants.commonTextSize))
    }
}
