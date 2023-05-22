//
//  SignupFormModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 22/05/2023.
//

import Foundation

protocol SignupFormModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(_ name: String) -> Bool
    func isValidEmail(_ email: String) -> Bool
    func isPasswordValid(_ password: String) -> Bool
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool
}
