//
//  MockSignupWebservice.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 22/05/2023.
//

import Foundation
@testable import PhotoApp

final class MockSignupWebservice: SignupWebserviceProtocol {
    var isSignupMethodCalled: Bool = false
    var response: SignupResponse? = nil
    var error: SignupError? = nil
    
    func signup(request: SignupFormRequestModel, completion: @escaping (SignupResponse?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        completion(response, error)
    }
}
