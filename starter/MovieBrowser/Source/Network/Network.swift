//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class Network {
    
    static let shared = Network()
    let apiKey = Strings.API.apiKey
    
    /**
     Search Movies
     
     - Parameter query: Text query to search
     - Parameter completion: closure block, returns Swift Result
     */
    class func movies(query: String, completion: @escaping(Swift.Result<MovieSearchResponseModel, MovieBrowserError>) -> Void) {
        Network.shared.sendRequest(request: MovieRequestModel(query: query)) { (result) in
            completion(result)
        }
    }
    
    /**
     Fetch Image
     
     - Parameter query: Text query to search
     - Parameter completion: closure block, returns Swift Result
     */
    class func image(query: String, completion: @escaping(Swift.Result<ImageResponseModel, MovieBrowserError>) -> Void) {
        Network.shared.sendRequest(request: ImageRequestModel(query: query)) { result in
            completion(result)
        }
    }
    
    private func sendRequest<T: Codable>(request: RequestModel, completion: @escaping (Swift.Result<T, MovieBrowserError>) -> Void) {
        URLSession.shared.dataTask(with: request.urlRequest()) { data, response, error in
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            guard let data = data else {
                return completion(Result.failure(MovieBrowserError(ErrorType.failedRequest.rawValue)))
            }
            
            DispatchQueue.main.async {
                switch T.self {
                    case is MovieSearchResponseModel.Type:
                        guard let responseModel = try? decoder.decode(T.self, from: data) else {
                            let error = MovieBrowserError(ErrorType.parsing.rawValue)
                            
                            completion(Result.failure(error))
                            return
                        }
                        completion(Result.success(responseModel))
                    case is ImageResponseModel.Type:
                        completion(Result.success(ImageResponseModel(data: data) as! T))
                    
                default:
                    completion(Result.failure(MovieBrowserError.generalError()))
                }
            }
        }.resume()
    }
}
