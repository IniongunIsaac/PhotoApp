//
//  SignupViewDelegate.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 22/05/2023.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfulSignup()
    func errorHandler(error: SignupError)
}
