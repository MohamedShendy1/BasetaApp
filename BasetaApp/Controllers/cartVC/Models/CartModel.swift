//
//  CartModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 11/05/2022.
//

import Foundation

// MARK: - Welcome
struct CartResponse: Codable {
    let status: Int
    let message: String
    let data: [CartModel]
}

// MARK: - Datum
struct CartModel: Codable {
    let id, qty: Int
    let price, itemNotes, itemName, addonsPrice: String
    let itemImage: String
    let addonsName: String
    let itemID: Int
    let variation: String?
    let addonsID: String

    enum CodingKeys: String, CodingKey {
        case id, qty, price
        case itemNotes = "item_notes"
        case itemName = "item_name"
        case addonsPrice = "addons_price"
        case itemImage = "item_image"
        case addonsName = "addons_name"
        case itemID = "item_id"
        case variation
        case addonsID = "addons_id"
    }
}
