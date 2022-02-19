//
//  SecondStage.swift
//  SpaceX
//
//  Created by habib Ghaffarzadeh on 2/19/22.
//

import Foundation

// MARK: - SecondStage
struct SecondStage: Codable {
    let thrust: Thrust?
    let payloads: Payloads?
    let reusable: Bool?
    let engines: Int?
    let fuelAmountTons: Double?
    let burnTimeSEC: Int?

    enum CodingKeys: String, CodingKey {
        case thrust, payloads, reusable, engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}
