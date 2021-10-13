//
//  ProductsPresenter.swift
//  TWGProducts
//
//  Created by Kamala Tennakoon on 6/10/21.
//

import Foundation

protocol LatestListPresenterType {
    func onViewDidLoad(withView view: LatestListViewController)
    func getLatestList()
    func showSearch()
    func showCart()
}

// Place holder for router delegate
protocol LatestListPresenterRouterDelegate: class { }

extension LatestListPresenter: LatestListPresenterType {
    
    func onViewDidLoad(withView view: LatestListViewController) {
        self.view = view
        getLatestList()
    }
    
    func getLatestList() {
        self.interactor.fetchLatestList()
    }
    
    func showSearch() {
        self.view?.showAlert("Search feature is under development.")
    }
    
    func showCart() {
        self.view?.showAlert("Cart is under development.")
    }
    
}

final class LatestListPresenter {
    private let interactor: LatestListInteractorType
    private var routerDelegate: LatestListPresenterRouterDelegate?
    
    weak var view: LatestListViewControllerType?
    
    init(interactor: LatestListInteractorType, routerDelegate: LatestListPresenterRouterDelegate) {
        self.interactor = interactor
        self.routerDelegate = routerDelegate
    }
}

extension LatestListPresenter: LatestListInteractorDelegate {
    
    func onLatestlistFetched(items: [Item]?, error: Error?) {
        guard let view = self.view else {
            assertionFailure("View should be present on LatestListPresenter")
            return
        }
        if(error != nil) {
            view.showAlert("Something went wrong, please try again later")
        }
        view.onRecievedData(items: items)
    }
}
