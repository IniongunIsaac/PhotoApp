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

    func testWhenCreated_ShouldHaveRequiredTextfieldsEmpty() throws {
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

}
