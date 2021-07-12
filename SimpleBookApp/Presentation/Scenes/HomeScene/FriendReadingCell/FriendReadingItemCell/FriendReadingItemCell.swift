//
//  FriendReadingItemCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class FriendReadingItemCell: UICollectionViewCell {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        image1.layer.cornerRadius = image1.frame.width / 2
        image2.layer.cornerRadius = image2.frame.width / 2
        image3.layer.cornerRadius = image3.frame.width / 2
        image4.layer.cornerRadius = image4.frame.width / 2
        image5.layer.cornerRadius = image5.frame.width / 2
        bookImage.layer.cornerRadius = 12
        bgView.backgroundColor = UIColor.random
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 1.0
        layer.cornerRadius = 16
        whiteView.layer.cornerRadius = 16
        whiteView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        
    }
    
    func configure(with item: BookModel){
        bookAuthor.text = item.author
        bookTitle.text = item.title
        let imageUrl = item.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        bookImage.kf.setImage( with: URL(string: httpsUrl))
    }

}
