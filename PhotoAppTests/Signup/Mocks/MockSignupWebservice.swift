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
    
    func signup(request: SignupFormRequestModel, completion: @escaping (SignupResponse?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        let response = SignupResponse(status: "Ok")
        completion(response, nil)
    }
}
