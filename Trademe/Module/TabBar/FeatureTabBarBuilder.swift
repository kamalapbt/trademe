//
//  FeatureTabBarBuilder.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 7/10/21.
//

import UIKit

typealias Features = (
    latestList: UIViewController,
    watchList: UIViewController,
    profile: UIViewController
)

class FeatureTabBarBuilder {
    
    static func build(usingModules modules: Features) -> UITabBarController {
        let tabs = FeatureTabBarRouter.tabs(withModules: modules)
        let tabBarController = FeatureTabBarController(tabs: tabs)
        return tabBarController
    }
    
}
