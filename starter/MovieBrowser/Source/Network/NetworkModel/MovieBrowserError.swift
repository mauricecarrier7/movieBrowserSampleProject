//
//  MovieBrowserError.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/3/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

enum ErrorType: String {
    case general = "Error_general"
    case parsing = "Error_parsing"
    case failedRequest = "Failed_request"
}


class MovieBrowserError: Error {
    var messageKey: String
    var message: String {
        return messageKey
    }
    
    init(_ messageKey: String) {
        self.messageKey = messageKey
    }
}

extension MovieBrowserError {
    class func generalError() -> MovieBrowserError {
        return MovieBrowserError(ErrorType.general.rawValue)
    }
}
