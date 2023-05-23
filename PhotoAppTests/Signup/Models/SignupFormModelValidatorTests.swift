//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import XCTest
@testable import PhotoApp

final class SignupFormModelValidatorTests: XCTestCase {
    
    private var validator: SignupFormModelValidator!

    override func setUp() {
        validator = SignupFormModelValidator()
    }

    override func tearDown() {
        validator = nil
    }
    
    func testIsValidFirstName_WhenValidFirstNameProvided_ShouldReturnTrue() {
        let isFirstNameValid = validator.isFirstNameValid(firstName: "Isaac")
        
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() function should have returned TRUE for a valid firstName but returned FALSE")
    }
    
    func testIsValidFirstName_WhenShortFirstNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = validator.isFirstNameValid(firstName: "I")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstName() method should return FALSE when value is less than \(SignupConstants.firstNameMinLength) characters")
    }
    
    func testIsFirstNameValid_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        let isFirstNameValid = validator.isFirstNameValid(firstName: "IniongunIniongun")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstName() method should return FALSE when value is greater than \(SignupConstants.firstNameMaxLength) characters")
    }
    
    func testIsLastNameValid_WhenValidLastNameProvided_ShouldReturnTrue() {
        let isValid = validator.isLastNameValid("Iniongun")
        XCTAssertTrue(isValid, "The isLastNameValid() method should return TRUE for a valid value")
    }
    
    func testIsLastNameValid_WhenEmptyLastNameProvided_ShouldReturnFalse() {
        let isValid = validator.isLastNameValid("")
        XCTAssertFalse(isValid, "The isLastNameValid() method should return FALSE for an empty value")
    }
    
    func testIsLastNameValid_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        let isValid = validator.isLastNameValid("X")
        XCTAssertFalse(isValid, "The isLastNameValid() method should return FALSE for a value that is less than \(SignupConstants.lastNameMinLength)")
    }
    
    func testIsLastNameValid_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        let isValid = validator.isLastNameValid("XIniongunIniongun")
        XCTAssertFalse(isValid, "The isLastNameValid() method should return FALSE for a value that is greater than \(SignupConstants.lastNameMaxLength)")
    }
    
    func testIsEmailValid_WhenEmptyEmailProvided_ShouldReturnFalse() {
        let isValid = validator.isValidEmail("")
        XCTAssertFalse(isValid, "The isValidEmail() method should return FALSE when an empty value is provided")
    }
    
    func testIsEmailValid_WhenValidEmailProvided_ShouldReturnTrue() {
        let isValid = validator.isValidEmail("isaac@gmail.com")
        XCTAssertTrue(isValid, "The isValidEmail() method should return TRU when valid value is provided")
    }
    
    func testIsEmailValid_WhenNoAtCharacterProvided_ShouldReturnFalse() {
        let isValid = validator.isValidEmail("isaac.com")
        XCTAssertFalse(isValid, "The isValidEmail() method should return FALSE when value provided does not contain an @ character")
    }
    
    func testIsEmailValid_WhenNoDotCharacterProvided_ShouldReturnFalse() {
        let isValid = validator.isValidEmail("isaac@com")
        XCTAssertFalse(isValid, "The isValidEmail() method should return FALSE when value provided does not contain a . character")
    }
    
    func testIsPasswordValid_WhenEmptyPasswordProvided_ShouldReturnFalse() {
        let isValid = validator.isPasswordValid("")
        XCTAssertFalse(isValid, "The isPasswordValid() method should return FALSE when an empty value is provided")
    }
    
    func testIsPasswordValid_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        let isValid = validator.isPasswordValid("11")
        XCTAssertFalse(isValid, "The isPasswordValid() method should return FALSE when provided value is less than \(SignupConstants.passwordMinLength) characters")
    }
    
    func testIsPasswordValid_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        let isValid = validator.isPasswordValid("123456789")
        XCTAssertFalse(isValid, "The isPasswordValid() method should return FALSE when provided value is greater than \(SignupConstants.passwordMaxLength) characters")
    }
    
    func testIsPasswordValid_WhenValidPasswordProvided_ShouldReturnTrue() {
        let isValid = validator.isPasswordValid("1111")
        XCTAssertTrue(isValid, "The isPasswordValid() method should return TRUE when provided value is between \(SignupConstants.passwordMinLength) and \(SignupConstants.passwordMaxLength) characters")
    }
    
    func testDoPasswordsMatch_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        let match = validator.doPasswordsMatch(password: "1234", repeatPassword: "1234")
        XCTAssertTrue(match, "doPasswordsMatch() should return TRUE for a matching pair")
    }
    
    func testDoPasswordsMatch_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        let match = validator.doPasswordsMatch(password: "12345", repeatPassword: "1234")
        XCTAssertFalse(match, "doPasswordsMatch() should return FALSE when passwords provided do not match")
    }
    
    func testThrowableTextValid_WhenIllegalCharacterProvided_ThrowsError() {
        XCTAssertThrowsError(try validator.throwableTextValid("Isaac%"), "Method should have thrown an error") { errorThrown in
            XCTAssertEqual(errorThrown as? SignupError, SignupError.illegalCharactersFound, "Errors should match")
        }
    }
    
    func testThrowableTextValid_WhenLegalCharactersProvided_DoesNotThrowError() {
        XCTAssertNoThrow(try validator.throwableTextValid("Isaac"), "Method should not throw an error when there are no illegal characters")
    }
    
    func testThrowableTextValid_WhenIllegalCharactersProvided_ThrowsError_DoCatchVersion() {
        do {
            let _ = try validator.throwableTextValid("Joy^^")
            XCTFail("Method is supposed to throw an error immediately when an illegal character is found in the string")
        } catch SignupError.illegalCharactersFound {
            return
        } catch {
            XCTFail("Only SignupError.illegalCharactersFound is supposed to be thrown when an illegal character is found")
        }
    }
    
    func testThrowableTextValid_WhenLegalCharactersProvided_DoesNotThrowError_DoCatchVersion() {
        do {
            let _ = try validator.throwableTextValid("Shaana")
        } catch {
            XCTFail("Method should not throw an error when there are no illegal characters")
        }
    }

}
