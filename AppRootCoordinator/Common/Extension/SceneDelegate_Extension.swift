//
//  SceneDelegate_Extension.swift
//  AppRootNavigation
//
//  Created by Julio Collado on 4/9/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
extension SceneDelegate {
    
    static var shared: SceneDelegate {
        return UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
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

