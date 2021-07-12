//
//  HomeDataSource.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class HomeDataSource: NSObject, UITableViewDataSource{
    
    private var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    private var books = [BookModel]()
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
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
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.deque(MainCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.deque(StoryCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.deque(BestsellingCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 3 {
            let cell = tableView.deque(SeriesCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 4 {
            let cell = tableView.deque(FriendReadingCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 5 {
            let cell = tableView.deque(AudioBooksCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 6 {
            let cell = tableView.deque(AlsoLikeCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 7 {
            let cell = tableView.deque(NewReleasesCell.self, for: indexPath)
            cell.configure(with: books, coordinator: viewModel.controller.coordinator!)
            return cell
        }
        if indexPath.row == 8 {
            let cell = tableView.deque(ComingSoonCell.self, for: indexPath)
            return cell
        }
        return .init()
    }
}


extension HomeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
