//
//  BookManager.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import Foundation

protocol BooksManagerProtocol: AnyObject {
    func fetchBooks(completion: @escaping ((Result<[BookModel], Error>) -> Void))
}

class BooksManager: BooksManagerProtocol {
    func fetchBooks(completion: @escaping ((Result<[BookModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/0f23e7a0-e72a-43e8-b107-659e809eb0d0?fbclid=IwAR2uO0wc_a-4iQaQDGiL7lvL46A5vLGCE9DWndHHj2HjBxBfw7fCv1haFjs"
        NetworkManager.shared.get(url: url) { (result: Result<[BookModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
