//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 21/05/2023.
//

import Foundation

final class SignupPresenter {
    
    private let validator: SignupFormModelValidatorProtocol
    
    init(validator: SignupFormModelValidatorProtocol) {
        self.validator = validator
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !validator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !validator.isLastNameValid(formModel.lastName) {
            return
        }
        
        if !validator.isValidEmail(formModel.email) {
            return
        }
        
        if !validator.isPasswordValid(formModel.password) {
            return
        }
        
        if !validator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
    }
}
