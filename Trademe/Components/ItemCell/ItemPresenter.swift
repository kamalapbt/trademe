//
//  ItemListCellPresenter.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 12/10/21.
//

import Foundation

protocol ItemPresenterType {
    func cellDidload(_ cell: ItemCellType)
    func loadPicture(_ url: String?)
}

extension ItemPresenter: ItemPresenterType {
    
    func cellDidload(_ cell: ItemCellType) {
        self.view = cell
    }
    
    func loadPicture(_ url: String?) {
        if let imageUrl = url {
            self.interactor.loadItemImage(URL(string: imageUrl)!)
        }
    }
}

final class ItemPresenter {
    private let interactor: ItemInteractorType
    
    weak var view: ItemCellType?
    
    init(interactor: ItemInteractorType) {
        self.interactor = interactor
    }
}

extension ItemPresenter: ItemInteractorDelegate {
    func onResourceLoaded(data: Data) {
        self.view?.onLoadedImage(data: data)
    }
    
}
