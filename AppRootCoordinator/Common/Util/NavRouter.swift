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
    private let navBuilder = NavBuilder()
    private var currentWindow: UIWindow {
        return UIApplication.shared.keyWindow!
    }
    
    private init() {
        self.setupSplashScreen()
    }
    
    func setupSplashScreen() {
        self.currentRootViewController = navBuilder.getNavigation(for: .splash, viewControllerIdentifier: SplashViewController.identifier)
    }
    
    func showLoginScreen(with animationOption: UIView.AnimationOptions) {
        self.currentRootViewController = navBuilder.getNavigation(for: .login, viewControllerIdentifier: Constants.UINavigationControllerIdentifier.LOGIN)
        if animationOption.isEmpty {
            createPushTransitionFromLeft()
        }
        animate(with: animationOption)
    }
    
    func switchToMainScreen(deepLinkType: DeepLinkType? = DeepLinkManager.shared.deepLinkType) {
        self.currentRootViewController = navBuilder.getNavigation(for: .main, viewControllerIdentifier: Constants.UINavigationControllerIdentifier.MAIN)
        
        defer { animate(with: .transitionCrossDissolve) }
        
        guard let deepLinkType = deepLinkType else { return }
        switch deepLinkType {
        case .activity:
            let activityViewController = navBuilder.getNavigation(for: .task, viewControllerIdentifier: ActivityViewController.identifier)
            activityViewController.modalPresentationStyle = .overCurrentContext
            (self.currentRootViewController as! UINavigationController).pushViewController(activityViewController, animated: false)
        case .messages:
            let messageViewController = navBuilder.getNavigation(for: .task, viewControllerIdentifier: MessagesViewController.identifier)
            messageViewController.modalPresentationStyle = .overCurrentContext
           (self.currentRootViewController as! UINavigationController).pushViewController(messageViewController, animated: false)
        }
        
    }
    
    private func animate(with option: UIView.AnimationOptions) {
        let transitionsDuration: TimeInterval = 0.3
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
    
}
