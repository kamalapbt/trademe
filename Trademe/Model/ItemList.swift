//
//  SearchResult.swift
//  TWGProducts
//
//  Created by Kamala Tennakoon on 30/09/21.
//

import Foundation

struct ItemList: Codable {
    let list: [Item]?
    let totalCount: Int
    let page: Int
    let pageSize: Int
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "TotalCount"
        case page = "Page"
        case pageSize = "PageSize"
        case list = "List"
    }
}

