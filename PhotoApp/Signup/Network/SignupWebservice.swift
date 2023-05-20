//
//  SignupWebservice.swift
//  PhotoApp
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import Foundation

class SignupWebservice {
    private let urlString: String
    private let urlSession: URLSession
    
    init(urlString: String, urlSession: URLSession = .shared) {
        self.urlString = urlString
        self.urlSession = urlSession
    }
    
    func signup(request: SignupFormRequestModel, completion: @escaping (SignupResponse?, SignupErrors?) -> Void) {
        guard let url = URL(string: urlString) else {
            // TODO: Create a unit test for invalid URL strings
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONEncoder().encode(request)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            //TODO: Write a unit test to handle error here
            
            if let data, let response = try? JSONDecoder().decode(SignupResponse.self, from: data) {
                completion(response, nil)
            } else {
                // TODO: Write a unit test to handle error here
            }
                
        }
        
        dataTask.resume()
    }
}
