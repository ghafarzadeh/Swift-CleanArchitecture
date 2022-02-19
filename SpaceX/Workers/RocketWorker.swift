//
//  RocketWorker.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import Foundation

typealias ErrorHandler = (String) -> Void
typealias RocketListHandler = ([Rocket]) -> Void
                          
protocol RocketStoreProtocol {
    func getRocketList(completionHandler:@escaping RocketListHandler, failure:@escaping ErrorHandler)
}

extension RocketStoreProtocol {
    func getRocketList(completionHandler:@escaping RocketListHandler, failure:@escaping ErrorHandler){}
}

class RocketWorker : RocketStoreProtocol {
    public init () {}
    
    func getRocketList(completionHandler:@escaping RocketListHandler, failure:@escaping ErrorHandler) {
        NetworkManager.shared.request(SpaceXService.getRocketList) { (response : [Rocket]) in
            completionHandler(response)
        } failure: { error in
            failure(error.localizedDescription)
        }
    }
}
