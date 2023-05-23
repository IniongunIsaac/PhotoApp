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
            let webservice = SignupWebservice(urlString: SignupConstants.signupURL)
            presenter = SignupPresenter(validator: validator,
                                        webservice: webservice,
                                        viewDelegate: self)
        }
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
        //TODO:
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
