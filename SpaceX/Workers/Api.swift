//
//  Api.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import Foundation
import Moya

enum SpaceXService {
    case getRocketList
}

extension SpaceXService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getRocketList:
            return "/rockets"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRocketList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getRocketList:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getRocketList:
            return ["Content-type": "application/json","Accept": "application/json"]
        }
    }
    
    
}
