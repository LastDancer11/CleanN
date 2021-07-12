//
//  FeedPersonCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class FeedPersonCell: UICollectionViewCell {

    @IBOutlet weak var imageOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageOutlet.layer.cornerRadius = imageOutlet.frame.width / 2
    }
    
    
    @IBAction func imageButton(_ sender: Any) {
    }
    
    func configure() {
        imageOutlet.setImage(UIImage(named: "ic-add"), for: .normal)
    }
}
