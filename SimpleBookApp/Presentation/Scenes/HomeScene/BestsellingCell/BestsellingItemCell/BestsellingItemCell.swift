//
//  BestsellingItemCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit
import Kingfisher

class BestsellingItemCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        bookImage.layer.cornerRadius = 12
    }
    
    func configure(with item: BookModel){
        titleLabel.text = item.title
        authorLabel.text = item.author
        let imageUrl = item.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        bookImage.kf.setImage( with: URL(string: httpsUrl))
    }

}
