//
//  ProfileModuleBuilder.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 12/10/21.
//

import UIKit

class ProfileRouter {
    static func entry(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        return factory(viewController)
    }
}
