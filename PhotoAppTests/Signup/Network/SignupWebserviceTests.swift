//
//  SignupWebserviceTests.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import XCTest
@testable import PhotoApp

final class SignupWebserviceTests: XCTestCase {

    var service: SignupWebservice!
    var request: SignupFormRequestModel!
    
    override func setUp() {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        service = SignupWebservice(urlString: SignupConstants.signupURL,
                                       urlSession: urlSession)
        
        request = SignupFormRequestModel(firstName: "Isaac",
                                             lastName: "Iniongun",
                                             email: "isaac@gmail.com",
                                             password: "12345678")
    }

    override func tearDown() {
        service = nil
        request = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignup_WhenGivenSuccessfulResponse_ReturnsSuccess() {
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = expectation(description: "Signup method expectation for a response that contains a success JSON")
        
        service.signup(request: request) { response, error in
            XCTAssertEqual(response?.status, "ok", "response status for successful JSON response should be 'ok'")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSignup_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = expectation(description: "Signup method expectation for a response that contains a different JSON structure")
        
        service.signup(request: request) { response, error in
            XCTAssertNil(response, "response model for a request containing an unknown JSON response should have been nil")
            XCTAssertEqual(error, SignupError.responseModelParsingError, "signup() did not return expected error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSignup_WhenEmptyURLProvided_ReturnsError() {
        service = SignupWebservice(urlString: "")
        
        let expectation = expectation(description: "An empty request URL expectation")
        
        service.signup(request: request) { response, error in
            XCTAssertNil(response, "signup() method should return 'nil' response for invalid request url")
            XCTAssertEqual(error, SignupError.invalidURL, "signup() method should return an invalidURL error")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 2)
    }

}
