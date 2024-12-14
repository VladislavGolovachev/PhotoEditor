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
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .stroke(Constants.strokeColor,
                            lineWidth: Constants.strokeLineWidth)
            )
            .frame(width: Constants.logoWidth, height: Constants.logoWidth)
            .clipped()
            .shadow(radius: Constants.shadowRadius)
    }
}

extension GoogleLogo {
    private enum Constants {
        static let strokeColor = Color(red: 0.9, green: 0.9, blue: 0.9)
        
        static let cornerRadius: CGFloat    = 12
        static let shadowRadius: CGFloat    = 7
        static let strokeLineWidth: CGFloat = 2
        static let logoWidth: CGFloat       = 70
    }
}

#Preview {
    GoogleLogo()
}
