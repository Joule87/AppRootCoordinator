//
//  DeepLinkManager.swift
//  AppRootNavigation
//
//  Created by Julio Collado on 4/9/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

class DeepLinkManager {
    static let shared = DeepLinkManager()
    var deepLinkType: DeepLinkType? {
        didSet {
            handleDeepLink()
        }
    }
    
    private init() {}
    
    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deepLinkType = ShortcutParser.shared.handleShortcut(item)
        print("Shortcut was handled successfully \(deepLinkType != nil) ")
        return deepLinkType != nil
    }
    
    private func handleDeepLink() {
        guard let deepLinkType = deepLinkType else { return }
        if UserDefaults.standard.bool(forKey: Constants.LOGGED_IN) {
            NavRouter.share.switchToMainScreen(deepLinkType: deepLinkType)
            // reset the deepLinkType back no nil, so it will not be triggered more than once
            self.deepLinkType = nil
        } else {
            // Do not reset the deepLinkType back no nil here, because it will be use after used log in.
            NavRouter.share.showLoginScreen(with: .transitionCrossDissolve)
        }
        
    }
}
