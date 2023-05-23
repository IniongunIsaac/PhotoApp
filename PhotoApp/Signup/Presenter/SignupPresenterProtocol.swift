//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(validator: SignupFormModelValidatorProtocol, webservice: SignupWebserviceProtocol, viewDelegate: SignupViewDelegateProtocol?)
    func processUserSignup(formModel: SignupFormModel)
}
