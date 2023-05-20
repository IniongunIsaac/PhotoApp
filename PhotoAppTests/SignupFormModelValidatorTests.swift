//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    private var sut: SignupFormModelValidator!

    override func setUp() {
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testIsValidFirstName_WhenValidFirstNameProvided_ShouldReturnTrue() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Isaac")
        
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() function should have returned TRUE for a valid firstName but returned FALSE")
    }
    
    func testIsValidFirstName_WhenShortFirstNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "I")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstName method should return FALSE when value is less than 2 characters")
    }

}
