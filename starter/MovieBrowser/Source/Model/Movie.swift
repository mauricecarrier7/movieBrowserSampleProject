//
//  Movie.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/3/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var posterPath: String?
    var overview: String?
    var releaseDate: String?
    var originalTitle: String?
    var backdropPath: String?
    var popularity: Double?
}
