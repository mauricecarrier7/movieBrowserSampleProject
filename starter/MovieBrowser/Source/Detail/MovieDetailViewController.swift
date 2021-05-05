//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    var dataSource: MovieDetailDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        dataSource?.delegate = self
        titleLabel.text = dataSource?.title
        descriptionLabel.text = dataSource?.overview
        imageView.image = dataSource?.image
        subtitleLabel.text = dataSource?.subtitle
    }
}

extension MovieDetailViewController: DataSourceDelegate {
    func refresh() {
        self.configure()
    }
}
