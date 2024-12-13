//
//  BottomBarItem.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 13.12.2024.
//

enum Mode: Hashable, Identifiable {
    var id: Self {
        return self
    }
    
    case normal
    case editing
    case drawing
}
