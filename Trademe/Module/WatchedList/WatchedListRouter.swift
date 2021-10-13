//
//  WatchedListModuleBuilder.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 12/10/21.
//

import UIKit

class WatchedListRouter {
    static func entry(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "WatchedListViewController") as! WatchedListViewController
        return factory(viewController)
    }
}

