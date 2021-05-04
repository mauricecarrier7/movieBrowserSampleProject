//
//  MovieRequestModel.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/3/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieRequestModel: RequestModel {
        
    var query: String
    
    init(query: String) {
        self.query = query
    }
    
    override var path: String {
        Strings.API.movieRequestPath
    }

    override var method: RequestType {
        RequestType.get
    }
    
    override var parameters: [String : String] {
        ["query": query, "api_key": Network.shared.apiKey]
    }
}
