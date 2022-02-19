//
//  Payloads.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import Foundation

// MARK: - Payloads
struct Payloads: Codable {
    let compositeFairing: CompositeFairing?
    let option1: String?

    enum CodingKeys: String, CodingKey {
        case compositeFairing = "composite_fairing"
        case option1 = "option_1"
    }
}
