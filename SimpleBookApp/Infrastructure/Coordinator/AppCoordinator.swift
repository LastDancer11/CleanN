//
//  AppCoordinator.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {

    // MARK: - Private properties
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    var booksManager: BooksManagerProtocol
    
    // MARK: - Init
    init(_ window: UIWindow?, navigationController: UINavigationController?) {
        self.window = window
        self.navigationController = navigationController
        self.booksManager = BooksManager()
    }
    
    func start() {
        let vc = TabBarController.instantiateFromStoryboard()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func proceedToDetailPage(with books: BookModel, coordinator: CoordinatorProtocol) {
        let vc = HomeDetailViewController.instantiateFromStoryboard()
        vc.books = books
        vc.coordinator = coordinator
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
