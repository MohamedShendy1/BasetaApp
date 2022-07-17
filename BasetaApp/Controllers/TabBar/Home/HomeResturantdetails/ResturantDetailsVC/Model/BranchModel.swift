//
//  ResturantDetailsModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 14/07/2022.
//

import Foundation

// MARK: - Welcome
struct ResturantDetailsResponse: Codable {
    let status: Int?
    let message: String?
    let data: ResturantDetailsModel
}

// MARK: - DataClass
struct ResturantDetailsModel: Codable {
    let id: Int
    let name, email, mobile, profileImage: String
    let loginType: String
    let googleID, facebookID: String?
    let type, restaurantID: Int
    let currency: String?
    let maxOrderQty, minOrderAmount, maxOrderAmount: Int
    let lat, lang: String
    let map: String?
    let firebase: String
    let timezone: String?
    let token: String
    let rate, referralAmount: String?
    let wallet: String
    let referralCode: String?
    let isAvailable: Int
    let otp: String?
    let isVerified: Int
    let branchID: String?
    let address: String
    let deliveryTimeFrom, deliveryTimeTo: Int
    let workingHourFrom, workingHourTo, createdAt, updatedAt: String
    let purchaseKey: String
    let image: String
    let isClose: Bool
    let restaurants: Restaurants

    enum CodingKeys: String, CodingKey {
        case id, name, email, mobile
        case profileImage = "profile_image"
        case loginType = "login_type"
        case googleID = "google_id"
        case facebookID = "facebook_id"
        case type
        case restaurantID = "restaurant_id"
        case currency
        case maxOrderQty = "max_order_qty"
        case minOrderAmount = "min_order_amount"
        case maxOrderAmount = "max_order_amount"
        case lat, lang, map, firebase, timezone, token, rate
        case referralAmount = "referral_amount"
        case wallet
        case referralCode = "referral_code"
        case isAvailable = "is_available"
        case otp
        case isVerified = "is_verified"
        case branchID = "branch_id"
        case address
        case deliveryTimeFrom = "delivery_time_from"
        case deliveryTimeTo = "delivery_time_to"
        case workingHourFrom = "working_hour_from"
        case workingHourTo = "working_hour_to"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case purchaseKey = "purchase_key"
        case image
        case isClose = "is_close"
        case restaurants
    }
}

// MARK: - Restaurants
struct RestaurantsModel: Codable {
    let id: Int
    let name: String
    let restaurantsTypesID, isActive, isFeatured: Int
    let createdAt, updatedAt: String
    let restaurantsTypes: [RestaurantsType]

    enum CodingKeys: String, CodingKey {
        case id, name
        case restaurantsTypesID = "RestaurantsTypes_id"
        case isActive = "is_active"
        case isFeatured = "is_featured"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case restaurantsTypes = "restaurants_types"
    }
}

// MARK: - RestaurantsType
struct RestaurantsType: Codable {
    let id: Int
    let name: String
    let image: String
    let isActive: Int
    let createdAt, updatedAt: String
    let pivot: Pivot

    enum CodingKeys: String, CodingKey {
        case id, name, image
        case isActive = "is_active"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pivot
    }
}

// MARK: - Pivot
struct Pivot: Codable {
    let restaurantsID, restaurantsTypesID: Int

    enum CodingKeys: String, CodingKey {
        case restaurantsID = "restaurants_id"
        case restaurantsTypesID = "restaurantsTypes_id"
    }
}
