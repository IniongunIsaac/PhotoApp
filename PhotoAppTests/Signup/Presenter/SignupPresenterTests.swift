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
    private let model = SignupFormModel(firstName: "Isaac",
                                lastName: "Iniongun",
                                email: "test@test.com",
                                password: "12345678",
                                repeatPassword: "12345678")

    override func setUp() {
        mockValidator = MockSignupFormModelValidator()
        mockSignupWebservice = MockSignupWebservice()
        presenter = SignupPresenter(validator: mockValidator, webservice: mockSignupWebservice)
    }

    override func tearDown() {
        mockSignupWebservice = nil
        mockValidator = nil
        presenter = nil
    }

    func testSignup_WhenInformationProvided_WillValidateEachProperty() {
        presenter.processUserSignup(formModel: model)
        
        XCTAssertTrue(mockValidator.isFirstNameValidated, "FirstName should be validated")
        XCTAssertTrue(mockValidator.isLastNameValidated, "Last name should be validated")
        XCTAssertTrue(mockValidator.isEmailValidated, "Email should be validated")
        XCTAssertTrue(mockValidator.isPasswordValidated, "Password should be validated")
        XCTAssertTrue(mockValidator.isRepeatPasswordValidated, "Repeat password should be validated")
    }
    
    func testSignup_WhenGivenValidFormModel_ShouldCallSignupWebservice() {
        presenter.processUserSignup(formModel: model)
        
        XCTAssertTrue(mockSignupWebservice.isSignupMethodCalled, "Signup method was not called in the webservice")
    }
    
    func testSignup_WhenSuccessful_ShouldCallSuccessOnView() {
        
    }

}
