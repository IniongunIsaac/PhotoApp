//
//  SignupErrors.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case responseModelParsingError
    case invalidURL
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .responseModelParsingError, .invalidURL:
            return ""
        case .failedRequest(let description):
            return NSLocalizedString(description, comment: "")
        }
    }
}
