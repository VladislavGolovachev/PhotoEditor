//
//  GoogleLogo.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import SwiftUI

struct GoogleLogo: View {
    var body: some View {
        Image("googlelogo")
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(red: 0.9, green: 0.9, blue: 0.9), lineWidth: 2)
            )
            .frame(width: 70, height: 70)
            .clipped()
            .shadow(radius: 7)
    }
}

#Preview {
    GoogleLogo()
}
