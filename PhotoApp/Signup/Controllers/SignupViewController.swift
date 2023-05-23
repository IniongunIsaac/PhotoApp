//
//  SignupViewController.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import UIKit

final class SignupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var presenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if presenter == nil {
            let validator = SignupFormModelValidator()
            let signupURL = ProcessInfo.processInfo.environment["signupURL"] ?? SignupConstants.signupURL
            let webservice = SignupWebservice(urlString: signupURL)
            presenter = SignupPresenter(validator: validator,
                                        webservice: webservice,
                                        viewDelegate: self)
        }
        readLaunchArguments()
    }
    
    private func readLaunchArguments() {
        #if DEBUG
        if CommandLine.arguments.contains("-skipSurvey") {
            print("Skipping the survey flow...")
        }
        
        if ProcessInfo.processInfo.arguments.contains("-skipSurvey") {
            print("Skipping the survey flow...")
        }
        #endif
    }

    @IBAction func showButtonViewControllerTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
        secondViewController.view.accessibilityIdentifier = "SecondViewController"
        present(secondViewController, animated: true)
    }
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let formModel = SignupFormModel(firstName: firstNameTextField.text!,
                                        lastName: lastNameTextField.text!,
                                        email: emailTextField.text!,
                                        password: passwordTextField.text!,
                                        repeatPassword: repeatPasswordTextField.text!)
        presenter?.processUserSignup(formModel: formModel)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfulSignup() {
        let alert = UIAlertController(title: "Success", message: "Your request was successful", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "successAlertDialog"
            self.present(alert, animated: true)
        }
    }
    
    func errorHandler(error: SignupError) {
        let alert = UIAlertController(title: "Error", message: "Your request could not be completed at the moment", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        DispatchQueue.main.async {
            alert.view.accessibilityIdentifier = "errorAlertDialog"
            self.present(alert, animated: true)
        }
    }
}
