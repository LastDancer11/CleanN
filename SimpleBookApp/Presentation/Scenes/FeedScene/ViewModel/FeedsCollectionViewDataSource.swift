//
//  FeedsCollectionViewDataSource.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class FeedsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private properties
    private var collectionView: UICollectionView!
    
    init(with collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(FeedPersonCell.self, for: indexPath)
        if indexPath.row == 0 {
            cell.configure()
        }
        return cell
    }
}

extension FeedsCollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
