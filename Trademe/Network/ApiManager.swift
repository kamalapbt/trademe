//
//  ApiManager.swift
//  TWGProducts
//
//  Created by Kamala Tennakoon on 30/09/21.
//

import Foundation

enum ApiError: Error {
    case invalidRequest
    case unKnown
    case emptyResponce
}

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.tmsandbox.co.nz"
        components.path = "/v1/listings/" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL components: \(components)"
            )
        }
        
        return url
    }
}

extension Endpoint {
    static func latest() -> Self {
        Endpoint(path: "latest.json",
                 queryItems: [URLQueryItem(
                    name: "rows",
                    value: "20"
                 ),
                 URLQueryItem(
                    name: "sort_order",
                    value: "ExpiryDesc"
                 )])
    }
}
