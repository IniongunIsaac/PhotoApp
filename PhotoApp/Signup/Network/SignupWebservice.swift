//
//  SignupWebservice.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import Foundation

final class SignupWebservice: SignupWebserviceProtocol {
    private let urlString: String
    private let urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(request: SignupFormRequestModel, completion: @escaping (SignupResponse?, SignupError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, .invalidURL)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            
            if let error {
                completion(nil, .failedRequest(description: error.localizedDescription))
                return
            }
            
            if let data, let response = try? JSONDecoder().decode(SignupResponse.self, from: data) {
                completion(response, nil)
            } else {
                completion(nil, .responseModelParsingError)
            }
                
        }
        
        dataTask.resume()
    }
}
