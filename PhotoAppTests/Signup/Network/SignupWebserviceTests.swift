//
//  SignupWebserviceTests.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import XCTest
@testable import PhotoApp

final class SignupWebserviceTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }

    func testSignup_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let service = SignupWebservice(urlString: SignupConstants.signupURL,
                                       urlSession: urlSession)
        
        let request = SignupFormRequestModel(firstName: "Isaac",
                                             lastName: "Iniongun",
                                             email: "isaac@gmail.com",
                                             password: "12345678")
        
        let expectation = expectation(description: "Signup webservice response expectation")
        
        service.signup(request: request) { response, error in
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }

}
