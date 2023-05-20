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
        
        XCTAssertFalse(isFirstNameValid, "The isFirstName() method should return FALSE when value is less than \(SignupConstants.firstNameMinLength) characters")
    }
    
    func testIsFirstNameValid_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = sut.isFirstNameValid(firstName: "IniongunIniongun")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstName() method should return FALSE when value is greater than \(SignupConstants.firstNameMaxLength) characters")
    }
    
    func testIsLastNameValid_WhenValidLastNameProvided_ShouldReturnTrue() {
        let isValid = sut.isLastNameValid("Iniongun")
        XCTAssertTrue(isValid, "The isLastNameValid() method should return TRUE for a valid value")
    }
    
    func testIsLastNameValid_WhenEmptyLastNameProvided_ShouldReturnFalse() {
        let isValid = sut.isLastNameValid("")
        XCTAssertFalse(isValid, "The isLastNameValid() method should return FALSE for an empty value")
    }
    
    func testIsLastNameValid_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        let isValid = sut.isLastNameValid("X")
        XCTAssertFalse(isValid, "The isLastNameValid() method should return FALSE for a value that is less than \(SignupConstants.lastNameMinLength)")
    }
    
    func testIsLastNameValid_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        let isValid = sut.isLastNameValid("XIniongunIniongun")
        XCTAssertFalse(isValid, "The isLastNameValid() method should return FALSE for a value that is greater than \(SignupConstants.lastNameMaxLength)")
    }
    
    func testIsEmailValid_WhenEmptyEmailProvided_ShouldReturnFalse() {
        let isValid = sut.isValidEmail("")
        XCTAssertFalse(isValid, "The isValidEmail() method should return FALSE when an empty value is provided")
    }
    
    func testIsEmailValid_WhenValidEmailProvided_ShouldReturnTrue() {
        let isValid = sut.isValidEmail("isaac@gmail.com")
        XCTAssertTrue(isValid, "The isValidEmail() method should return TRU when valid value is provided")
    }
    
    func testIsEmailValid_WhenNoAtCharacterProvided_ShouldReturnFalse() {
        let isValid = sut.isValidEmail("isaac.com")
        XCTAssertFalse(isValid, "The isValidEmail() method should return FALSE when value provided does not contain an @ character")
    }
    
    func testIsEmailValid_WhenNoDotCharacterProvided_ShouldReturnFalse() {
        let isValid = sut.isValidEmail("isaac@com")
        XCTAssertFalse(isValid, "The isValidEmail() method should return FALSE when value provided does not contain a . character")
    }
    
    func testIsPasswordValid_WhenEmptyPasswordProvided_ShouldReturnFalse() {
        let isValid = sut.isPasswordValid("")
        XCTAssertFalse(isValid, "The isPasswordValid() method should return FALSE when an empty value is provided")
    }
    
    func testIsPasswordValid_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        let isValid = sut.isPasswordValid("11")
        XCTAssertFalse(isValid, "The isPasswordValid() method should return FALSE when provided value is less than \(SignupConstants.passwordMinLength) characters")
    }
    
    func testIsPasswordValid_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        let isValid = sut.isPasswordValid("123456789")
        XCTAssertFalse(isValid, "The isPasswordValid() method should return FALSE when provided value is greater than \(SignupConstants.passwordMaxLength) characters")
    }
    
    func testIsPasswordValid_WhenValidPasswordProvided_ShouldReturnTrue() {
        let isValid = sut.isPasswordValid("1111")
        XCTAssertTrue(isValid, "The isPasswordValid() method should return TRUE when provided value is between \(SignupConstants.passwordMinLength) and \(SignupConstants.passwordMaxLength) characters")
    }
    
    func testDoPasswordsMatch_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        let match = sut.doPasswordsMatch(password: "1234", repeatPassword: "1234")
        XCTAssertTrue(match, "doPasswordsMatch() should return TRUE for a matching pair")
    }
    
    func testDoPasswordsMatch_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        let match = sut.doPasswordsMatch(password: "12345", repeatPassword: "1234")
        XCTAssertFalse(match, "doPasswordsMatch() should return FALSE when passwords provided do not match")
    }

}
