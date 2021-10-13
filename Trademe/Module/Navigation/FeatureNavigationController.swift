//
//  FeatureNavigationController.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 6/10/21.
//

import UIKit

class FeatureNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(view: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        self.navigationController?.setViewControllers(<#T##viewControllers: [UIViewController]##[UIViewController]#>, animated: <#T##Bool#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
