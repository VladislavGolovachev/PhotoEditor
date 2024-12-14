//
//  PickerType.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import Foundation

enum PickerType {
    enum Source: Hashable, Identifiable {
        var id: Self {
            return self
        }
        
        case camera
        case library
    }
}
