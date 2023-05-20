//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Isaac Iniongun on 20/05/2023.
//

import Foundation

class MockURLProtocol: URLProtocol {
    
    static var stubResponseData: Data?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
