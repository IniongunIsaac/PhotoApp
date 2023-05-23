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
