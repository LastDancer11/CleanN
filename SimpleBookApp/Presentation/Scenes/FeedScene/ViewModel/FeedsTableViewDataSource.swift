//
//  FeedsTableViewDataSource.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class FeedsTableViewDataSource: NSObject, UITableViewDataSource {
    
    private var tableView: UITableView!
    private var viewModel: FeedViewModelProtocol!
    private var books = [BookModel]()
    
    init(with tableView: UITableView, viewModel: FeedViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.viewModel = viewModel
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func refresh() {
        viewModel.fetchBooks { [weak self] result in
            switch result {
            case .success(let books):
                self?.books = books
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(FeedCell.self, for: indexPath)
        cell.configure(with: books[indexPath.row])
        return cell
    }
}

extension FeedsTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
