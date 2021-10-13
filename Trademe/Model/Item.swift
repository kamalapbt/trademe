//
//  Product.swift
//  TWGProducts
//
//  Created by Kamala Tennakoon on 30/09/21.
//

import Foundation

struct Item: Codable {
    let listingId: Int
    let imageUrl: String?
    let title: String?
    let region: String?
    let priceDisplay: String?
    let buyNowPrice: Float?
    let isClassified: Bool?
    
    enum CodingKeys: String, CodingKey {
        case listingId = "ListingId";
        case imageUrl = "PictureHref"
        case title = "Title"
        case region = "Region"
        case priceDisplay = "PriceDisplay"
        case buyNowPrice = "BuyNowPrice"
        case isClassified = "IsClassified"
    }
}
