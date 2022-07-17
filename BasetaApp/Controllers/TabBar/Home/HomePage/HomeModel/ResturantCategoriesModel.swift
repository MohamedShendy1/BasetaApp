//
//  ResturantTypesModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 4/22/22.
//

import Foundation

struct ResturantTypesModel: Codable {
    let status: Int?
    let message: String?
    let data: [RestaurantsTypeModel]?
}
struct RestaurantsTypeModel: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let isActive: Int?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
