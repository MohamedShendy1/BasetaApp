//
//  AddressModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 11/05/2022.
//

import Foundation
// MARK: - Welcome
struct AddressResponse: Codable {
    let status: Int?
    let message: String?
    let data: [AddressModel]?
}

// MARK: - Datum
struct AddressModel: Codable {
    let id, userID, addressType: Int?
    let address, lat, lang, landmark: String?
    let building, pincode, deliveryCharge: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case addressType = "address_type"
        case address, lat, lang, landmark, building, pincode
        case deliveryCharge = "delivery_charge"
    }
}
