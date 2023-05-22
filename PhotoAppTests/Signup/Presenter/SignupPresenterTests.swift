//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 21/05/2023.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignup_WhenInformationProvided_WillValidateEachProperty() {
        let model = SignupFormModel(firstName: "Isaac",
                                    lastName: "Iniongun",
                                    email: "test@test.com",
                                    password: "12345678",
                                    repeatPassword: "12345678")
        
        let mockValidator = MockSignupFormModelValidator()
        
        let presenter = SignupPresenter(validator: mockValidator)
        
        presenter.processUserSignup(formModel: model)
        
        XCTAssertTrue(mockValidator.isFirstNameValidated, "FirstName should be validated")
        XCTAssertTrue(mockValidator.isLastNameValidated, "Last name should be validated")
        XCTAssertTrue(mockValidator.isEmailValidated, "Email should be validated")
        XCTAssertTrue(mockValidator.isPasswordValidated, "Password should be validated")
        XCTAssertTrue(mockValidator.isRepeatPasswordValidated, "Repeat password should be validated")
    }

}
