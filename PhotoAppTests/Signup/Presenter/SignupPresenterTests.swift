//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 21/05/2023.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    
    private var mockValidator: MockSignupFormModelValidator!
    private var mockSignupWebservice: MockSignupWebservice!
    private var presenter: SignupPresenter!
    private let signupModel = SignupFormModel(firstName: "Isaac",
                                lastName: "Iniongun",
                                email: "test@test.com",
                                password: "12345678",
                                repeatPassword: "12345678")
    private var mockSignupViewDelegate: MockSignupViewDelegate!

    override func setUp() {
        mockValidator = MockSignupFormModelValidator()
        mockSignupWebservice = MockSignupWebservice()
        mockSignupViewDelegate = MockSignupViewDelegate()
        presenter = SignupPresenter(validator: mockValidator,
                                    webservice: mockSignupWebservice,
                                    viewDelegate: mockSignupViewDelegate)
    }

    override func tearDown() {
        mockSignupWebservice = nil
        mockValidator = nil
        presenter = nil
        mockSignupViewDelegate = nil
    }

    func testSignup_WhenInformationProvided_WillValidateEachProperty() {
        presenter.processUserSignup(formModel: signupModel)
        
        XCTAssertTrue(mockValidator.isFirstNameValidated, "FirstName should be validated")
        XCTAssertTrue(mockValidator.isLastNameValidated, "Last name should be validated")
        XCTAssertTrue(mockValidator.isEmailValidated, "Email should be validated")
        XCTAssertTrue(mockValidator.isPasswordValidated, "Password should be validated")
        XCTAssertTrue(mockValidator.isRepeatPasswordValidated, "Repeat password should be validated")
    }
    
    func testSignup_WhenGivenValidFormModel_ShouldCallSignupWebservice() {
        presenter.processUserSignup(formModel: signupModel)
        
        XCTAssertTrue(mockSignupWebservice.isSignupMethodCalled, "Signup method was not called in the webservice")
    }
    
    func testSignup_WhenSuccessful_ShouldCallSuccessOnView() {
        let expectation = expectation(description: "Expect successfulSignup() method to be called")
        mockSignupViewDelegate.expectation = expectation
        let response = SignupResponse(status: "Ok")
        mockSignupWebservice.response = response
        
        presenter.processUserSignup(formModel: signupModel)
        
        wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successfulSignup() method was called more than one time or it wasn't called at all")
        XCTAssertEqual(mockSignupWebservice.response, response, "Returned response is not the same as the defined response")
    }
    
    func testSignup_WhenError_ShouldCallErrorHandlerOnView() {
        let expectation = expectation(description: "Expect that the errorHandler() method is called on the view")
        mockSignupViewDelegate.expectation = expectation
        let error = SignupError.invalidURL
        mockSignupWebservice.error = error
        
        presenter.processUserSignup(formModel: signupModel)
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertEqual(mockSignupViewDelegate.successfulErrorHandlerCounter, 1, "The errorHandler() method was either called more than once or not at all")
        XCTAssertEqual(mockSignupWebservice.error, error, "Returned error does not match the expected error defined")
    }

}
