//
//  SeriesCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class SeriesCell: UITableViewCell {

    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Variables
    private var dataSource: CellDataSource!
    private var viewModel: CellViewModelProtocol!
    var coordinator: CoordinatorProtocol?
    var books = [BookModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        setUpCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with books: [BookModel], coordinator: CoordinatorProtocol) {
        self.books = books
        self.coordinator = coordinator
        configureDataSource()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        collectionView.registerNib(class: SeriesItemCell.self)
    }
    
    private func configureDataSource() {
        viewModel = CellViewModel(coordinator: coordinator!)
        dataSource = CellDataSource(with: collectionView, books: books, viewModel: viewModel, cellToDeque: SeriesItemCell.self)
    }
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 320, height: 240)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 0)
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension SeriesCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 240)
    }
}
