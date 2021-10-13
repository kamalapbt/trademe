//
//  NetworkManager.swift
//  TWGProducts
//
//  Created by Kamala Tennakoon on 4/10/21.
//

import Foundation
protocol NetworkSession {
    func fetchData(_ endpoint: Endpoint, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
    func loadData(_ url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}
extension URLSession: NetworkSession {
    func fetchData(_ endpoint: Endpoint, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        var request: URLRequest = URLRequest(url: endpoint.url)
        request.setValue("OAuth oauth_consumer_key=\"A1AC63F0332A131A78FAC304D007E7D1\", oauth_signature_method=\"PLAINTEXT\", oauth_signature=\"EC7F18B17A062962C6930A8AE88B16C7&\"", forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = dataTask(with: request) { (data, response, error) in
            completionHandler(data, response, error)
        }
        task.resume()
    }
    func loadData(_ url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url) { data, response, error in
            completionHandler(data, response, error)
        }
        task.resume()
    }
}
class NetworkManager {
    private let session: NetworkSession

    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }

    func fetchRequest(_ endpoint: Endpoint, completionHandler: @escaping (Result<Data, Error>) -> Void) {
        session.fetchData(endpoint) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data, let _ = response {
                completionHandler(.success(data))
            } else {
                completionHandler(.failure(ApiError.unKnown))
            }
        }
    }
    
    func getResourse(
        _ url: URL,
        mode: Mode,
        completionHandler: @escaping (Result<Resource, Error>) -> Void
    ) {
        session.loadData(url) { data, response, error in
            if let error = error {
                completionHandler(.failure(error))
            } else if let data = data, let _ = response {
                completionHandler(.success(Resource(mode: mode, data: data)))
            } else {
                completionHandler(.failure(ApiError.unKnown))
            }
        }
    }
}
