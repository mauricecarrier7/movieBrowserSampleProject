//
//  SearchViewDataSource.swift
//  MovieBrowser
//
//  Created by Maurice Carrier on 5/4/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

protocol DataSourceDelegate: AnyObject {
    func refresh()
}

class SearchDataSource: NSObject {

    weak var delegate: DataSourceDelegate?
    
    var movies: [Movie] = [] {
        didSet {
            delegate?.refresh()
        }
    }

    func movie(at index: Int) -> Movie {
        movies[index]
    }
    
    private func search(query: String) {
        Network.movies(query: query) { result in
            switch result {
            case let .success(model):
                self.movies = model.results
            case .failure:
                self.movies = []
            }
        }
    }
}

extension SearchDataSource: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      search(query: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search(query: searchBar.text ?? "")
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        movies = []
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
