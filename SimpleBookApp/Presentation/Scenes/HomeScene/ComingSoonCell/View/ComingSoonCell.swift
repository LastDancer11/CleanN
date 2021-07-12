//
//  ComingSoonCell.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class ComingSoonCell: UITableViewCell {
    
    // MARK: - Private Variables
    private var dataSource: CellDataSource!
    private var viewModel: CellViewModelProtocol!
    var coordinator: CoordinatorProtocol?
    var books = [BookModel]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
