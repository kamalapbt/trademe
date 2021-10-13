//
//  FeatureRouter.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 6/10/21.
//

import UIKit

class FeatureTabBarRouter {
    var viewController: UIViewController
    
    init(withModuleEntryView view: UIViewController) {
        self.viewController = view
    }
    
    static func tabs(withModules modules: Features) -> Features {
        let latastListTabBarItem = UITabBarItem(title: "Browse", image: UIImage(named: "search"), tag: 101)
        let watchListTabBarItem = UITabBarItem(title: "Watchlist", image: UIImage(named: "watchlist"), tag: 102)
        let profileTabBarItem = UITabBarItem(title: "My Trade Me", image: UIImage(named: "profile-16"), tag: 103)
        modules.latestList.tabBarItem = latastListTabBarItem
        modules.watchList.tabBarItem = watchListTabBarItem
        modules.profile.tabBarItem = profileTabBarItem
        
        return (latestList: modules.latestList, watchList: modules.watchList, profile: modules.profile)
    }
}
