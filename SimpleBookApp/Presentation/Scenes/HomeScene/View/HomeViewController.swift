//
//  HomeViewController.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource: HomeDataSource!
    private var viewModel:  HomeViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setupLayout()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupLayout() {
        tableView.registerNib(class: MainCell.self)
        tableView.registerNib(class: StoryCell.self)
        tableView.registerNib(class: BestsellingCell.self)
        tableView.registerNib(class: SeriesCell.self)
        tableView.registerNib(class: FriendReadingCell.self)
        tableView.registerNib(class: AudioBooksCell.self)
        tableView.registerNib(class: AlsoLikeCell.self)
        tableView.registerNib(class: NewReleasesCell.self)
        tableView.registerNib(class: ComingSoonCell.self)
    }
    
    private func configureViewModel() {
        viewModel = HomeViewModel(controller: self)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }

}
