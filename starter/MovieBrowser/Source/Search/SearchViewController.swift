//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    let dataSource: SearchDataSource
    
    init() {
        self.dataSource = SearchDataSource()
        super.init()
        self.dataSource.delegate = self
    }
    
    required init?(coder: NSCoder) {
        self.dataSource = SearchDataSource()
        super.init(coder: coder)
        self.dataSource.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowDetailSegue",
            let indexPath = tableView.indexPathForSelectedRow,
              let movieDetailViewController = segue.destination as? MovieDetailViewController else { return }
        
        movieDetailViewController.dataSource = MovieDetailDataSource(movie: dataSource.movie(at: indexPath.row))
    }
    
    private func configure() {
        navigationItem.title = Strings.SearchViewController.title
        searchBar.placeholder = Strings.SearchViewController.placeholder
        searchBar.delegate = dataSource
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? SearchControllerCell else {
            return UITableViewCell()
        }
        let movie = dataSource.movie(at: indexPath.row)
        cell.configure(for: movie)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowDetailSegue", sender: tableView)
    }
}

extension SearchViewController: DataSourceDelegate {
    func refresh() {
        tableView.reloadData()
    }
}
