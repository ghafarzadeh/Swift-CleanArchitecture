//
//  NetworkManager.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import Foundation
import Moya

struct NetworkManager {
    
    enum RequestError: Error {
        case unknownError
        case connectionError
        case authorizationError
        case invalidRequest
        case notFound
        case invalidResponse
        case serverError
        case serverUnavailable
    }
    
    static var baseUrl = "https://api.spacexdata.com/v4"
    
    private let provider = MoyaProvider<SpaceXService>()
    
    static let shared = NetworkManager()
    
    func request<T:Codable>(_ request: SpaceXService, success completionHandler: @escaping (T) -> Void , failure errorHandler: @escaping (MoyaError) -> Void) -> Cancellable {
        
        return provider.request(request) { result in
            switch result {
            case let .success(response):
                do{
                    let data = try response.map(T.self)
                    completionHandler(data)
                } catch {
                    print(String(describing: error))
                }
            case let .failure(error):
                errorHandler(error)
            }
        }
    }
}
