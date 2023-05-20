//
//  SignupFormModelValidator.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import Foundation

class SignupFormModelValidator {
    func isFirstNameValid(firstName: String) -> Bool {
        var returnValue = true
        
        if firstName.count < 2 {
            returnValue = false
        }
        
        return returnValue
    }
}
