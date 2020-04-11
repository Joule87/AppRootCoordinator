//
//  NavRouter.swift
//  AppRootCoordinator
//
//  Created by Julio Collado on 4/10/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

class NavRouter {
    static let share = NavRouter()
    var currentRootViewController: UIViewController! {
        didSet {
            AppRootHelper.rootViewController = currentRootViewController
        }
    }
    
    var deepLinkType: DeepLinkType? {
        didSet {
            handleDeepLink()
        }
    }
    
    private let transitionsDuration: TimeInterval = 0.3
    private var currentWindow: UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
    private init() {
        self.setupSplashScreen()
    }
    
    func setupSplashScreen() {
        let storyBoard = UIStoryboard(name: "Splash", bundle: nil)
        let splashViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        self.currentRootViewController = splashViewController
    }
    
    func showLoginScreen(with animationOption: UIView.AnimationOptions) {
        let storyBoard = UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginNavigationController") as! UINavigationController
        self.currentRootViewController = loginViewController
        if animationOption.isEmpty {
            createPushTransitionFromLeft()
        }
        animate(with: animationOption)
    }
    
    func switchToMainScreen() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        self.currentRootViewController = mainViewController
        
        animate(with: .transitionCrossDissolve)
    }
    
    private func animate(with option: UIView.AnimationOptions) {
        UIView.transition(with: currentWindow, duration: transitionsDuration, options: option, animations: {}, completion: nil)
    }
    
    private func createPushTransitionFromLeft() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        currentWindow.layer.add(transition, forKey: kCATransition)
    }
    
    private func handleDeepLink() {
        guard let deepLinkType = deepLinkType else { return }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = storyBoard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
        self.currentRootViewController = mainViewController
        
        
        switch deepLinkType {
        case .activity:
            let activityViewController = ActivityViewController()
            activityViewController.modalPresentationStyle = .overCurrentContext
            mainViewController.pushViewController(activityViewController, animated: false)
        case .messages:
            let messageViewController = MessagesViewController()
            messageViewController.modalPresentationStyle = .overCurrentContext
            mainViewController.pushViewController(messageViewController, animated: false)
        }
        
        // reset the deepLinkType back no nil, so it will not be triggered more than once
        self.deepLinkType = nil
        
    }
    
}
