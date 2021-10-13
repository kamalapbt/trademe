//
//  ProductsRouter.swift
//  TWGProducts
//
//  Created by Kamala Tennakoon on 6/10/21.
//

import UIKit

// Place holder for router type
protocol LatestListRouterType { }

protocol LatestListRouterDelegate{ }

final class LatestListRouter {
    private weak var navigationController: UINavigationController?
    private weak var modalNavigationController: UINavigationController?
}

extension LatestListRouter: LatestListRouterType {
    static func entry(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let interactor = LatestListInteractor(networkManager: NetworkManager())
        let presenter = LatestListPresenter(interactor: interactor, routerDelegate: self.init())
        interactor.interactorDelegate = presenter
        let viewController = LatestListViewController.instantiate(withPresenter: presenter)
        
        return factory(viewController)
    }
}
// Place holder for router delegate implementation
extension LatestListRouter: LatestListPresenterRouterDelegate{}
