//
//  TextToolBar.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

import SwiftUI

struct TextToolBar: View {
    @Environment(\.dismiss) private var dismiss
    
    @Binding var textBox: TextBox
    
    private let fonts = UIFont.familyNames.map {
        FontName(name: $0)
    }
    private let sizes = [
        10,
        12,
        14,
        18,
        24,
        36,
        48,
        64,
        72,
        96,
        144
    ]
    
    var body: some View {
        HStack(spacing: 10) {
            ColorPicker(String(),
                        selection: $textBox.textColor)
            .labelsHidden()
            
            Menu {
                ForEach(0..<fonts.count, id: \.self) {
                    let index = $0
                    Button(fonts[$0].name) {
                        textBox.font = fonts[index].name
                    }
                }
            } label: {
                Image(systemName: "textformat")
            }
            .commonTextStyle(color: .gray)
            
            Menu {
                ForEach(0..<sizes.count, id: \.self) {
                    let index = $0
                    Button("\(sizes[$0]) pt") {
                        textBox.size = CGFloat(sizes[index])
                    }
                }
            } label: {
                Image(systemName: "character.cursor.ibeam")
            }
            .commonTextStyle(color: .gray)
            
            Button {
                withAnimation {
                    textBox.isBold.toggle()
                }
            } label: {
                Image(systemName: "bold")
                    .padding(4)
            }
            .commonTextStyle(color: textBox.isBold ? .white : .gray)
            .background(textBox.isBold ? .gray : .clear)
            .clipShape(.circle)
        }
    }
}

struct FontName: Identifiable, Hashable {
    var id = UUID().uuidString
    var name: String
}
