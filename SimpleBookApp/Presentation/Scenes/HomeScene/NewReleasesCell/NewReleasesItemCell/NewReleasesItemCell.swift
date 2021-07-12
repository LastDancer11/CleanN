//
//  NewReleasesItemCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class NewReleasesItemCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var nobleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }

    private func setupLayout() {
        bookImage.layer.cornerRadius = 12
        nobleLabel.layer.cornerRadius = 20
        nobleLabel.layer.masksToBounds = true
    }
    
    func configure(with item: BookModel){
        bookTitle.text = item.title
        bookAuthor.text = item.author
        let imageUrl = item.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        bookImage.kf.setImage( with: URL(string: httpsUrl))
    }
}
