//
//  ApiProvider.swift
//  Loblaws Assignment
//
//  Created by Saim Zahid on 2019-09-04.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class ApiProvider {
    public static let shared = ApiProvider()
    
    public enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
    
    private let urlSession = URLSession.shared
    private let subredditURL = URL(string: "https://www.reddit.com/r/swift/.json")!
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    private func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIServiceError>) -> Void) {
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(_):
                completion(.failure(.apiError))
            }
            }.resume()
    }
    
    public func fetchSwiftSubredditData(result: @escaping (Result<SwiftSubreddit, APIServiceError>) -> Void) {
        fetchResources(url: subredditURL, completion: result)
    }
}

