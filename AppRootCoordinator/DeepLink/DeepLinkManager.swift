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
    private var deepLinkType: DeepLinkType?
    
    private init() {}
    
    @discardableResult
    func handleShortcut(item: UIApplicationShortcutItem) -> Bool {
        deepLinkType = ShortcutParser.shared.handleShortcut(item)
        print("shortcut was handled successfully \(deepLinkType != nil) ")
        return deepLinkType != nil
    }
    
    // check existing deepLinkType and perform action
    func checkDeepLink() {
        NavRouter.share.deepLinkType = deepLinkType
        print("NavRouter deepLinkType settled to \(deepLinkType) ")
        // reset deepLinkType after handling
        self.deepLinkType = nil
    }
}
