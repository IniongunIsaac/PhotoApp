//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 21/05/2023.
//

import Foundation

final class SignupPresenter {
    
    private let validator: SignupFormModelValidatorProtocol
    private let webservice: SignupWebserviceProtocol
    
    init(validator: SignupFormModelValidatorProtocol, webservice: SignupWebserviceProtocol) {
        self.validator = validator
        self.webservice = webservice
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
        
        let request = SignupFormRequestModel(firstName: formModel.firstName,
                                             lastName: formModel.lastName,
                                             email: formModel.email,
                                             password: formModel.password)
        
        webservice.signup(request: request) { response, error in
            
        }
    }
}
