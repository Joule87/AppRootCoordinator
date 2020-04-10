//
//  AppRootHelper.swift
//  AppRootNavigation
//
//  Created by Julio Collado on 4/9/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

struct AppRootHelper {
    static var rootViewController: UIViewController {
        get {
            if #available(iOS 13, *) {
                return SceneDelegate.shared.rootViewController
            } else {
                return AppDelegate.shared.rootViewController
            }
        }
        
        set {
            if #available(iOS 13, *) {
                SceneDelegate.shared.rootViewController = newValue
            } else {
                AppDelegate.shared.rootViewController = newValue
            }
        }
    }
}
