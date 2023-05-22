//
//  SignupWebserviceProtocol.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 22/05/2023.
//

import Foundation

protocol SignupWebserviceProtocol {
    func signup(request: SignupFormRequestModel, completion: @escaping (SignupResponse?, SignupError?) -> Void)
}
