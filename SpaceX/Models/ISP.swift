//
//  ISP.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import Foundation

// MARK: - ISP
struct ISP: Codable {
    let seaLevel, vacuum: Int?

    enum CodingKeys: String, CodingKey {
        case seaLevel = "sea_level"
        case vacuum
    }
}
