//
//  TitleView.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct TitleView: View {
    let text: String
    
    var body: some View {
        HStack {
            Text(text)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
    }
}
