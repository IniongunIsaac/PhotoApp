//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import Foundation
@testable import PhotoApp

final class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled: Bool = false
    
    init(validator: PhotoApp.SignupFormModelValidatorProtocol,
         webservice: PhotoApp.SignupWebserviceProtocol,
         viewDelegate: PhotoApp.SignupViewDelegateProtocol?
    ) {
        
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}
