//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 22/05/2023.
//

import Foundation
import XCTest
@testable import PhotoApp

final class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var successfulErrorHandlerCounter = 0
    
    func successfulSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: SignupError) {
        successfulErrorHandlerCounter += 1
        expectation?.fulfill()
    }
}
