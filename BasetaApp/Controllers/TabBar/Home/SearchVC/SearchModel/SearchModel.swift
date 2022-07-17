//
//  SearchModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 08/05/2022.
//

import Foundation

struct SearchModel: Codable {
    let status: Int
    let message: String
    let data: [SearchItems]
}

// MARK: - Datum
struct SearchItems: Codable {
    let id: Int
    let itemName: String

//    enum CodingKeys: String, CodingKey {
//        case id
//        case itemName = "item_name"
//    }
}

