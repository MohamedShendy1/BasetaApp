//
//  RegisterModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 1/23/22.
//


import Foundation

// MARK: - Welcome
struct RegisterResponse: Codable {
    let status: Int?
    let message: String?
    let data: UserModel?
}

// MARK: - DataClass
struct UserModel: Codable {
    let id: Int?
    let name, mobile, email, loginType: String?
    let referralCode: String?
    let profileImage: String?

    enum CodingKeys: String, CodingKey {
        case id, name, mobile, email
        case loginType = "login_type"
        case referralCode = "referral_code"
        case profileImage = "profile_image"
    }
}


extension AppDelegate {
    
    class func setUserData(user:UserModel?){
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedPerson")
            
//            let token = AppDelegate.getUserData()?.token
//            print(token ?? "lll")
        }
    }
    
    class func getUserData()-> UserModel?{
        let defaults = UserDefaults.standard
        if let savedPerson = defaults.object(forKey: "SavedPerson") as? Data {
            let decoder = JSONDecoder()
            if let loadedPerson = try? decoder.decode(UserModel.self, from: savedPerson) {
                return loadedPerson
            }
        }
        return nil
    }
    
    class func deleteUserData(){
      UserDefaults.standard.removeObject(forKey: "SavedPerson")
    }
    
    
}

