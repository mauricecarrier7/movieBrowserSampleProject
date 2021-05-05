//
//  SearchControllerCell.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/4/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

class SearchControllerCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var accessoryLabel: UILabel!
    
    func configure(for movie: Movie) {
        titleLabel.text = movie.originalTitle?.capitalized
        subtitleLabel.text = movie.releaseDate?.longDateFormat()
        accessoryLabel.text = String(format: "%.1f", movie.voteAverage ?? 0)
    }
}
