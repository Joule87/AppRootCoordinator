//
//  ShortcutParser.swift
//  AppRootNavigation
//
//  Created by Julio Collado on 4/9/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

class ShortcutParser {
    
    static let shared = ShortcutParser()
    
    private init() { }
    
    func registerShortcuts() {
        let activityIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIcon.IconType.bookmark)
        let activityShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.activity.rawValue, localizedTitle: "Recent Activity", localizedSubtitle: nil, icon: activityIcon, userInfo: nil)
        
        let messageIcon = UIApplicationShortcutIcon(type: UIApplicationShortcutIcon.IconType.message)
        let messageShortcutItem = UIApplicationShortcutItem(type: ShortcutKey.messages.rawValue, localizedTitle: "Messages", localizedSubtitle: nil, icon: messageIcon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [activityShortcutItem, messageShortcutItem]
        print("Shortcuts registered")
    }

    func handleShortcut(_ shortcut: UIApplicationShortcutItem) -> DeepLinkType? {
        switch shortcut.type {
        case ShortcutKey.activity.rawValue:
            return  .activity
        case ShortcutKey.messages.rawValue:
            return  .messages
        default:
            return nil
        }
    }
}
