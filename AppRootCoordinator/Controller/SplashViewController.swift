//
//  SplashViewController.swift
//  AppRootCoordinator
//
//  Created by Julio Collado on 4/10/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    static let identifier = "SplashViewController"
    
    private let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4)
        makeServiceCall()
    }
    
    fileprivate func didValidateUserSession() {
        if UserDefaults.standard.bool(forKey: Constants.LOGGED_IN) {
            NavRouter.share.switchToMainScreen()
        } else {
            NavRouter.share.showLoginScreen(with: .transitionCrossDissolve)
        }
    }
    
    private func makeServiceCall() {
        print("Simulating a service call")
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            self.activityIndicator.stopAnimating()
            self.didValidateUserSession()
        }
    }
}
