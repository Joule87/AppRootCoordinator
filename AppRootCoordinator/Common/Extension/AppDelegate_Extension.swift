//
//  AppDelegate_Extension.swift
//  AppRootNavigation
//
//  Created by Julio Collado on 4/9/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    var rootViewController: UIViewController {
        get {
            return window!.rootViewController!
        }
        set {
            window!.rootViewController = newValue
        }
    }
}
