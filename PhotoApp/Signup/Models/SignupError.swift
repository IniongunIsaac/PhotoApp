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
    case illegalCharactersFound
    
    var errorDescription: String? {
        switch self {
        case .responseModelParsingError, .invalidURL, .illegalCharactersFound:
            return ""
        case .failedRequest(let description):
            return NSLocalizedString(description, comment: "")
        }
    }
}
