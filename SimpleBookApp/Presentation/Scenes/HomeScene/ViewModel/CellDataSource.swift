//
//  CellDataSource.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class CellDataSource: NSObject, UICollectionViewDataSource{
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    private var viewModel: CellViewModelProtocol!
    private var books = [BookModel]()
    private var cellToDeque: UICollectionViewCell.Type?
    
    init(with collectionView: UICollectionView, books: [BookModel], viewModel: CellViewModelProtocol,cellToDeque: UICollectionViewCell.Type) {
        super.init()
        
        self.books = books
        self.viewModel = viewModel
        self.cellToDeque = cellToDeque
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellToDeque = cellToDeque else {return .init()}
        if cellToDeque == MainItemCell.self {
            let cell = collectionView.deque(MainItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == StoryItemCell.self {
            let cell = collectionView.deque(StoryItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == BestsellingItemCell.self {
            let cell = collectionView.deque(BestsellingItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == SeriesItemCell.self {
            let cell = collectionView.deque(SeriesItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == FriendReadingItemCell.self {
            let cell = collectionView.deque(FriendReadingItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == AudioBooksItemCell.self {
            let cell = collectionView.deque(AudioBooksItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == AlsoLikeItemCell.self {
            let cell = collectionView.deque(AlsoLikeItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == NewReleasesItemCell.self {
            let cell = collectionView.deque(NewReleasesItemCell.self, for: indexPath)
            cell.configure(with: books[indexPath.row])
            return cell
        }
        if cellToDeque == ComingSoonItemCell.self {
            let cell = collectionView.deque(ComingSoonItemCell.self, for: indexPath)
            //cell.configure(with: books[indexPath.row])
            return cell
        }
        return .init()
    }
}

extension CellDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        viewModel.coordinator.proceedToDetailPage(with: books[indexPath.row], coordinator: viewModel.coordinator)
    }
}

