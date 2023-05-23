//
//  MockURLSession.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 23/05/2023.
//

import Foundation

final class MockURLSession: URLSession {
    var url: URL?
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    override func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        self.url = url
        completionHandler(data, response, error)
        return MockURLSessionDataTask()
    }
}

final class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}
