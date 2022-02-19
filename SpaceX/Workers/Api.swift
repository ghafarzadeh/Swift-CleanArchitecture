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
    case getRocketDetail(id: String)
}

extension SpaceXService: TargetType {
    var baseURL: URL {
        return URL(string: NetworkManager.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getRocketList:
            return "/rockets"
        case .getRocketDetail(let id):
            return "/rockets/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRocketList, .getRocketDetail:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getRocketList, .getRocketDetail:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getRocketList, .getRocketDetail:
            return ["Content-type": "application/json","Accept": "application/json"]
        }
    }
    
    
}
