//
//  RequestModel.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/3/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

enum RequestType: String {
    case get = "GET"
    case post = "POST"
}


class RequestModel: NSObject {
    
    var path: String {
        ""
    }

    var parameters: [String : String] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }
    
    var method: RequestType {
        body.isEmpty ? .get : .post
    }
    
    var body: [String: Any?] {
        [:]
    }
    
    func urlRequest() -> URLRequest {
        var components = URLComponents(string: path)!
        
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request: URLRequest = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue.uppercased()
        
        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }
        
        return request
    }
}
