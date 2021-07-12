//
//  CoordinatorDelegate.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

protocol CoordinatorDelegate: UIViewController{
    var coordinator: CoordinatorProtocol? { get set }
}
