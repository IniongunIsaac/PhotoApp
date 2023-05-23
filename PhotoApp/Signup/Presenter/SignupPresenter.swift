//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 21/05/2023.
//

import Foundation

final class SignupPresenter: SignupPresenterProtocol {
    
    private let validator: SignupFormModelValidatorProtocol
    private let webservice: SignupWebserviceProtocol
    private weak var viewDelegate: SignupViewDelegateProtocol?
    
    init(validator: SignupFormModelValidatorProtocol,
         webservice: SignupWebserviceProtocol,
         viewDelegate: SignupViewDelegateProtocol?
    ) {
        self.validator = validator
        self.webservice = webservice
        self.viewDelegate = viewDelegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !validator.isFirstNameValid(firstName: formModel.firstName) {
            viewDelegate?.errorHandler(error: SignupError.invalidFirstName)
            return
        }
        
        if !validator.isLastNameValid(formModel.lastName) {
            viewDelegate?.errorHandler(error: SignupError.invalidLastName)
            return
        }
        
        if !validator.isValidEmail(formModel.email) {
            viewDelegate?.errorHandler(error: SignupError.invalidEmail)
            return
        }
        
        if !validator.isPasswordValid(formModel.password) {
            viewDelegate?.errorHandler(error: SignupError.invalidPassword)
            return
        }
        
        if !validator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            viewDelegate?.errorHandler(error: SignupError.invalidRepeatPassword)
            return
        }
        
        let request = SignupFormRequestModel(firstName: formModel.firstName,
                                             lastName: formModel.lastName,
                                             email: formModel.email,
                                             password: formModel.password)
        
        webservice.signup(request: request) { [weak self] response, error in
            if let response {
                self?.viewDelegate?.successfulSignup()
                return
            } else if let error {
                self?.viewDelegate?.errorHandler(error: error)
            }
        }
    }
}
