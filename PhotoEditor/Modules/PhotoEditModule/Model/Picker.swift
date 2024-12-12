//
//  Picker.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 12.12.2024.
//

import UIKit

enum Picker {
    enum Source: Hashable, Identifiable {
        var id: Self {
            return self
        }
        case camera, library
    }
}
