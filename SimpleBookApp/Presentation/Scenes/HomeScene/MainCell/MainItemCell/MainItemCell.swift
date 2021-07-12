//
//  MainItemCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit
import Kingfisher

class MainItemCell: UICollectionViewCell {

    @IBOutlet weak var bookImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with item: BookModel){
        let imageUrl = item.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        bookImage.kf.setImage( with: URL(string: httpsUrl))
    }
}
