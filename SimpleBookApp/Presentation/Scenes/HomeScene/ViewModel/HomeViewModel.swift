//
//  HomeViewModel.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import Foundation

protocol HomeViewModelProtocol {
    
    func fetchBooks(completion: @escaping ((Result<[BookModel], Error>) -> Void))
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchBooks(completion: @escaping ((Result<[BookModel], Error>) -> Void)){
        controller.coordinator?.booksManager.fetchBooks(completion: completion)
    }
}
