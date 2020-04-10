//
//  MainViewController.swift
//  AppRootCoordinator
//
//  Created by Julio Collado on 4/10/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        title = "Main Screen"
        let logoutButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: true)
        
        let activityButton = UIBarButtonItem(title: "Activity", style: .plain, target: self, action: #selector(showActivityScreen))
        navigationItem.setRightBarButton(activityButton, animated: true)
    }
    
    @objc private func logout() {
        // clear the user session (example only, not for the production)
        UserDefaults.standard.set(false, forKey: "LOGGED_IN")
        NavRouter.share.showLoginScreen(with: [])
    }
    
    @objc func showActivityScreen(animated: Bool = true) {
//        let activityViewController = ActivityViewController()
//        navigationController?.pushViewController(activityViewController, animated: animated)
    }

}
