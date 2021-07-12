//
//  TabBarController.swift
//  SimpleBookApp
//
//  Created by Nana Jimsheleishvili on 12.07.21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {

    //private var libraryCoordinator = LibraryCoordinator()
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = self.viewControllers![0] as! HomeViewController
        vc1.coordinator = coordinator
        
        
        let vc2 = self.viewControllers![1] as! FeedViewController
        vc2.coordinator = coordinator
        
        //self.viewControllers![3] = libraryCoordinator.navigationController!
    }

}
