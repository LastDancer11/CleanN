//
//  FeedViewController.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class FeedViewController: BaseViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private Variables
    private var collectionDataSource: FeedsCollectionViewDataSource!
    private var tableViewDataSource: FeedsTableViewDataSource!
    private var viewModel: FeedViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureDataSource()
        setUpCollectionView()
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: FeedPersonCell.self)
        tableView.registerNib(class: FeedCell.self)
    }
    
    private func configureDataSource() {
        viewModel = FeedViewModel(controller: self)
        collectionDataSource = FeedsCollectionViewDataSource(with: collectionView)
        tableViewDataSource = FeedsTableViewDataSource(with: tableView, viewModel: viewModel)
        tableViewDataSource.refresh()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 44, height: 44)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 44, height: 240)
    }
}
