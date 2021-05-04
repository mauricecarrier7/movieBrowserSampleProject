//
//  NetworkTests.swift
//  MovieBrowserTests
//
//  Created by Maurice Carrier on 5/3/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import XCTest
@testable import MovieBrowser

class NetworkTests: XCTestCase {

    func testMovieRequest() {
        let expectation = XCTestExpectation(description: "Fetch Star Wars")
        
        Network.movies(query: "Star Wars") { result in
            switch result {
            case let .success(model):
                let nonMatchingResults = model.results.filter { movie in
                    return movie.originalTitle?.contains("Star Wars") == false
                }
                
                let matchingResults = model.results.filter { movie in
                    return movie.originalTitle?.contains("Star Wars") == true
                }
                
                XCTAssertTrue(matchingResults.count > 0)
                XCTAssertFalse(nonMatchingResults.count > 0)
                expectation.fulfill()
                
            case let .failure(error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
