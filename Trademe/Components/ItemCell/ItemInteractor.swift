//
//  ItemListCellInteractor.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 12/10/21.
//

import Foundation


protocol ItemInteractorType {
    var interactorDelegate: ItemInteractorDelegate? { get set }

    func loadItemImage(_ url: URL)
}

protocol ItemInteractorDelegate: class {
    func onResourceLoaded(data: Data)
}

final class ItemInteractor {
    private let networkManger: NetworkManager
    weak var interactorDelegate: ItemInteractorDelegate?
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManger = networkManager
    }
    
}

extension ItemInteractor: ItemInteractorType {
    func loadItemImage(_ url: URL) {
        self.networkManger.getResourse(url, mode: .image)  { data in
            switch(data) {
            case .success(let result):
                if let imageData = result.data {
                    self.interactorDelegate?.onResourceLoaded(data: imageData)
                }
            case .failure(_):
                break
            }
        }
    }
}
