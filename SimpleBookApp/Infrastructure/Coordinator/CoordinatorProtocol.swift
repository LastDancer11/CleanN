//
//  CoordinatorProtocol.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var booksManager: BooksManagerProtocol { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proceedToDetailPage(with books: BookModel, coordinator: CoordinatorProtocol)

}

extension CoordinatorProtocol {
    
    var booksManager: BooksManagerProtocol? {
        set { print("") }
        get { nil }
    }
    
    func proceedToDetailPage(with books: BookModel, coordinator: CoordinatorProtocol) {}

}
