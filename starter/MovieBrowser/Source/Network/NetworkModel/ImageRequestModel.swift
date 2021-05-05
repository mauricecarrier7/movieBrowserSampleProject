//
//  ImageRequestModel.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/4/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class ImageRequestModel: RequestModel  {

    var query: String

    init(query: String) {
        self.query = query
    }
    
    override var path: String {
        "\(Strings.API.imageRequestPath)/\(query)"
    }

    override var method: RequestType {
        RequestType.get
    }
}
