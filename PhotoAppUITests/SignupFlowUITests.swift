//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import XCTest

final class SignupFlowUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var firstNameTextField: XCUIElement!
    private var lastNameTextField: XCUIElement!
    private var emailTextField: XCUIElement!
    private var passwordTextField: XCUIElement!
    private var repeatPasswordTextField: XCUIElement!
    private var signupButton: XCUIElement!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        app = XCUIApplication()
        app.launch()
        
        firstNameTextField = app.textFields["firstNameTextField"]
        lastNameTextField = app.textFields["lastNameTextField"]
        emailTextField = app.textFields["emailTextField"]
        passwordTextField = app.secureTextFields["passwordTextField"]
        repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
        signupButton = app.buttons["signupButton"]
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        firstNameTextField = nil
        lastNameTextField = nil
        emailTextField = nil
        passwordTextField = nil
        repeatPasswordTextField = nil
        signupButton = nil
        
        try super.tearDownWithError()
    }

    func testViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        XCTAssertTrue(firstNameTextField.isEnabled, "The first name UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(lastNameTextField.isEnabled, "The last name UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(emailTextField.isEnabled, "The email UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(passwordTextField.isEnabled, "The password UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(repeatPasswordTextField.isEnabled, "The repeat password UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(signupButton.isEnabled, "The sign up UIButton cannot be found or is not enabled for user interaction")
    }
    
    func testViewController_WhenInvalidFormSubmitted_PresentsErrorAlertDialog() {
        firstNameTextField.tap()
        firstNameTextField.typeText("I")
        
        lastNameTextField.tap()
        lastNameTextField.typeText("G")
        
        emailTextField.tap()
        emailTextField.typeText("G")
        
        passwordTextField.tap()
        passwordTextField.typeText("G")
        
        repeatPasswordTextField.tap()
        repeatPasswordTextField.typeText("G")
        
        signupButton.tap()
        
        XCTAssertTrue(app.alerts["errorAlertDialog"].waitForExistence(timeout: 1), "An error alert dialog was not presented when an invalid form was submitted")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
