//
//  NavBuilder.swift
//  AppRootCoordinator
//
//  Created by Julio Collado on 4/13/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

class NavBuilder {
    
    func getNavigation(for storyBoard: StoryBoardNaming, viewControllerIdentifier: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: storyBoard.rawValue, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        return viewController
    }
    
}
