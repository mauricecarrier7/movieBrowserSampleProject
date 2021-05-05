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
        let fetchQuery = "Star Wars"
        
        Network.movies(query: fetchQuery) { result in
            switch result {
            case let .success(model):
                
                let matchingResults = model.results.filter { movie in
                    return movie.originalTitle?.contains(fetchQuery) == true
                }
                
                let nonMatchingResults = model.results.filter { movie in
                    return movie.originalTitle?.contains(fetchQuery) == false
                }
                
                XCTAssertTrue(!matchingResults.isEmpty)
                XCTAssertTrue(nonMatchingResults.isEmpty)
                expectation.fulfill()
                
            case let .failure(error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testImageRequest() {
        let expectation = XCTestExpectation(description: "Fetch Netflix logo")
        let fetchQuery = "wwemzKWzjKYJFfCeiB57q3r4Bcm.png"
        
        Network.image(query: fetchQuery) { result in
            switch result {
            case let .success(model):
                
                XCTAssertNotNil(model.image())
                expectation.fulfill()
                
            case let .failure(error):
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
}
