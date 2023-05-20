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
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            returnValue = false
        }
        
        return returnValue
    }
    
    func isLastNameValid(_ name: String) -> Bool {
        name.count > SignupConstants.lastNameMinLength && name.count < SignupConstants.lastNameMaxLength
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        password.count > SignupConstants.passwordMinLength && password.count < SignupConstants.passwordMaxLength
    }
}
