//
//  PayloadWeight.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import Foundation

// MARK: - PayloadWeight
struct PayloadWeight: Codable {
    let id, name: String?
    let kg, lb: Int?
}
