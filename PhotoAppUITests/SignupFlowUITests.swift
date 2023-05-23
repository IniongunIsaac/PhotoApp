//
//  PhotoAppUITests.swift
//  PhotoAppUITests
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import XCTest

final class SignupFlowUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        
    }

    func testViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        let app = XCUIApplication()
        app.launch()
        
        let firstNameTextField = app.textFields["firstNameTextField"]
        let lastNameTextField = app.textFields["lastNameTextField"]
        let emailTextField = app.textFields["emailTextField"]
        let passwordTextField = app.secureTextFields["passwordTextField"]
        let repeatPasswordTextField = app.secureTextFields["repeatPasswordTextField"]
        let signupButton = app.buttons["signupButton"]
        
        XCTAssertTrue(firstNameTextField.isEnabled, "The first name UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(lastNameTextField.isEnabled, "The last name UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(emailTextField.isEnabled, "The email UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(passwordTextField.isEnabled, "The password UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(repeatPasswordTextField.isEnabled, "The repeat password UITextField cannot be found or is not enabled for user interaction")
        XCTAssertTrue(signupButton.isEnabled, "The sign up UIButton cannot be found or is not enabled for user interaction")
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
