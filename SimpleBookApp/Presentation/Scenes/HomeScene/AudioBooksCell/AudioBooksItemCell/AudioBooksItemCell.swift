//
//  AudioBooksItemCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class AudioBooksItemCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    private func setupLayout() {
        
        bgView.layer.cornerRadius = 12
        bgView.backgroundColor = UIColor.random
        bookImage.layer.cornerRadius = 12
    }
    
    func configure(with item: BookModel){
        bookTitle.text = item.title
        bookAuthor.text = item.author
        let imageUrl = item.image ?? ""
        let httpsUrl = imageUrl.replacingOccurrences(of: "http:", with: "https:")
        bookImage.kf.setImage( with: URL(string: httpsUrl))
    }
}
