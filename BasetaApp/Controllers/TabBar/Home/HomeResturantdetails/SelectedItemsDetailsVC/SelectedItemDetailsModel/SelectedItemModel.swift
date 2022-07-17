//
//  SelectedItemModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 09/05/2022.
import Foundation

// MARK: - Welcome
struct SelectedItemresponse: Codable {
    let status: Int?
    let message: String?
    let data: SelectedItemModel?
}

// MARK: - DataClass
struct SelectedItemModel: Codable {
    let id: Int?
    let itemName: String?
    let itemDescription:  String?
    let deliveryTime: String?
    let itemStatus: Int?
    let categoryName, tax: String?
    let images: [ImageModel]?
    let variation: [VariationModel]?
    let ingredients, addons: String?

    enum CodingKeys: String, CodingKey {
        case id
        case itemName = "item_name"
        case itemDescription = "item_description"
        case deliveryTime = "delivery_time"
        case itemStatus = "item_status"
        case categoryName = "category_name"
        case tax, images, variation, ingredients, addons
    }
}

// MARK: - Image
struct ImageModel: Codable {
    let itemID: Int
    let imageName: String
    let itemimage: String

    enum CodingKeys: String, CodingKey {
        case itemID = "item_id"
        case imageName = "image_name"
        case itemimage
    }
}

// MARK: - Variation
struct VariationModel: Codable {
    let id, itemID: Int
    let variation: String?
    let productPrice, salePrice: String

    enum CodingKeys: String, CodingKey {
        case id
        case itemID = "item_id"
        case variation
        case productPrice = "product_price"
        case salePrice = "sale_price"
    }
}
