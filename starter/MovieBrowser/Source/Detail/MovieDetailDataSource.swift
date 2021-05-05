//
//  MovieDetailDataSource.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/4/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailDataSource: NSObject {
    
    private var movie: Movie
    weak var delegate: DataSourceDelegate?
    
    var title: String?
    var subtitle: String?
    var overview: String?
    var image: UIImage = #imageLiteral(resourceName: "placeholder")
    
    
    init(movie: Movie) {
        self.movie = movie
        super.init()
        configure()
    }
    
    private func configure() {
        title = movie.originalTitle?.capitalized
        overview = movie.overview
        subtitle = Strings.DetailViewController.releaseDate + (movie.releaseDate?.shortDateFormat() ?? "")
        
        fetchImage()
    }
    
    private func fetchImage() {
        Network.image(query: movie.posterPath ?? "") { [weak self] result in
            switch result {
            case let .success(model):
                guard let image = model.image() else { return }
                self?.image = image
                self?.delegate?.refresh()
            case .failure:
                return
            }
        }

    }
}
