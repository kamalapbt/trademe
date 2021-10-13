//
//  ListItemCell.swift
//  Trademe
//
//  Created by Kamala Tennakoon on 7/10/21.
//

import UIKit

struct ListItem {
    let imageUrl: String?
    let title: String?
    let subTitle: String?
    let detail: String?
    let subDetail: String?
    
    init(_ item: Item) {
        imageUrl = item.imageUrl
        title = item.title
        subTitle = item.region
    
        var price = item.priceDisplay
        var priceType = "Current price"
        if(item.isClassified == true) {
            priceType = "Asking price"
        } else if(item.buyNowPrice != nil)  {
            price = item.buyNowPrice?.description
            priceType = "Buy Now price"
        }
        detail = price
        subDetail = priceType
    }
}
protocol ItemCellType: class {
    var presenter: ItemPresenterType! { get }
    func onLoadedImage(data: Data)
}


class ItemCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var subDetail: UILabel!
    
    var presenter: ItemPresenterType! {
        didSet {
            presenter.cellDidload(self)
        }
    }
    
    var item: ListItem? {
        didSet {
            self.presenter.loadPicture(item?.imageUrl)
            self.title.text = item?.title
            self.subTitle.text = item?.subTitle
            self.detail.text = item?.detail
            self.subDetail.text = item?.subDetail
        }
    }
    
}

extension ItemCell: ItemCellType {
    func onLoadedImage(data: Data) {
        DispatchQueue.main.async {
            self.picture?.image = UIImage(data: data)
        }
    }
}
