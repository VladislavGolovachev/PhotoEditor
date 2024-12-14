//
//  ValidationError.swift
//  PhotoEditor
//
//  Created by Владислав Головачев on 14.12.2024.
//

enum ValidationError: String, Error {
    case emptyFields = "Some fields are empty"
    case emailNotValid = "Please, check your email. It's not valid"
    case passwordNotLong = "Password must consist at least 5 letters"
}
