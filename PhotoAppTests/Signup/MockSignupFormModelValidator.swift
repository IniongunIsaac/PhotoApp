//
//  MockSignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 22/05/2023.
//

import Foundation
@testable import PhotoApp

class MockSignupFormModelValidator: SignupFormModelValidatorProtocol {
    var isFirstNameValidated: Bool = false
    var isLastNameValidated: Bool = false
    var isEmailValidated: Bool = false
    var isPasswordValidated: Bool = false
    var isRepeatPasswordValidated: Bool = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(_ name: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isValidEmail(_ email: String) -> Bool {
        isEmailValidated = true
        return isEmailValidated
    }
    
    func isPasswordValid(_ password: String) -> Bool {
        isPasswordValidated = true
        return isPasswordValidated
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        isRepeatPasswordValidated = true
        return isRepeatPasswordValidated
    }
}
