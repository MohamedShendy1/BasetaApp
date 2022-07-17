//
//  SetUI.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/4/22.
//

import Foundation
import UIKit
extension ChangePasswordVC{
    
    func setHeader(){
        header.titleLbl.text = "Change Password"
    }
    func SecurePassword(){
        newPasswordTF.isSecureTextEntry = !newPasswordTF.isSecureTextEntry
    
        if newPasswordTF.isSecureTextEntry
        {
            btnNewPassSecure.setImage(UIImage.init(systemName: "eye.slash"), for: .normal)
        }else
        {
            btnNewPassSecure.setImage(UIImage.init(systemName: "eye"), for: .normal)
        }
    }
    
    func ConfirmSecurePassword(){
        ConfirmPasswordTF.isSecureTextEntry = !ConfirmPasswordTF.isSecureTextEntry
    
        if ConfirmPasswordTF.isSecureTextEntry
        {
            btnConfirmPassSecure.setImage(UIImage.init(systemName: "eye.slash"), for: .normal)
        }else
        {
            btnConfirmPassSecure.setImage(UIImage.init(systemName: "eye"), for: .normal)
    
        }
    }
}
