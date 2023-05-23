//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import XCTest
@testable import PhotoApp

final class SignupViewControllerTests: XCTestCase {
    
    private var storyboard: UIStoryboard!
    private var viewcontroller: SignupViewController!
    

    override func setUpWithError() throws {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewcontroller = (storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController)
        viewcontroller.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        storyboard = nil
        viewcontroller = nil
    }

    func testViewController_WhenCreated_ShouldHaveRequiredTextfieldsEmpty() throws {
        let firstNameTextField = try XCTUnwrap(viewcontroller.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(viewcontroller.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(viewcontroller.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(viewcontroller.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(viewcontroller.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(firstNameTextField.text, "", "First name textfield was not empty when the view initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last name textfield was not empty when the view initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email textfield was not empty when the view initially loaded")
        XCTAssertEqual(passwordTextField.text, "", "Password textfield was not empty when the view initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "", "Repeat password textfield was not empty when the view initially loaded")
    }
    
    func testViewController_WhenCreated_HasSignupButtonAndAction() throws {
        let signupButton: UIButton = try XCTUnwrap(viewcontroller.signupButton, "Sign up button is not connected to an IBOutlet")
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: viewcontroller, forControlEvent: .touchUpInside), "No actions for signup button found")
        
        XCTAssertEqual(signupButtonActions.count, 1, "Signup button actions cannot be empty or more than one")
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There's no action with the name signupButtonTapped assigned to signup button")
    }
    
    func testViewController_WhenSignupButtonTapped_InvokesTheSignupProcess() {
        let mockValidator = MockSignupFormModelValidator()
        let mockWebservice = MockSignupWebservice()
        let mockViewDelegate = MockSignupViewDelegate()
        let mockPresenter = MockSignupPresenter(validator: mockValidator,
                                                webservice: mockWebservice,
                                                viewDelegate: mockViewDelegate)
        
        viewcontroller.presenter = mockPresenter
        
        viewcontroller.signupButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(mockPresenter.processUserSignupCalled, "the processUserSignup() method was not called on the presenter when the signup button was tapped")
    }
    
    func testEmailTextField_WhenCreated_HasEmailAddressContentTypeSet() throws {
        let emailTextField = try XCTUnwrap(viewcontroller.emailTextField, "Email UITextField is not connected")
        XCTAssertEqual(emailTextField.textContentType, .emailAddress, "Email UITextContentType is not set or does not equal .emailAddress")
    }
    
    func testEmailTextField_WhenCreated_HasKeyboardTypeSet() throws {
        let emailTextField = try XCTUnwrap(viewcontroller.emailTextField, "Email UITextField is not connected")
        XCTAssertEqual(emailTextField.keyboardType, .emailAddress, "Email UIKeyboardType is not set or does not equal .emailAddress")
    }
    
    func testPasswordTextField_WhenCreated_IsSecureEntryField() throws {
        let passwordTextField = try XCTUnwrap(viewcontroller.passwordTextField, "Password UITextField is not connected")
        XCTAssertTrue(passwordTextField.isSecureTextEntry, "Password textfield should be a secure textfield")
    }

}
