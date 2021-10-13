//
//  FeatureTabBarControllerViewController.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 6/10/21.
//

import UIKit

class FeatureTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(tabs: Features) {
        super.init(nibName: nil, bundle: nil)
        viewControllers = [tabs.latestList, tabs.watchList, tabs.profile]
        self.tabBar.tintColor = UIColor.init(named: "Tasman500")
        self.tabBar.unselectedItemTintColor = UIColor.init(named: "TextLight")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
