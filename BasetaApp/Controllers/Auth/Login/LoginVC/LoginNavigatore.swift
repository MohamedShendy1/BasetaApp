//
//  LoginNavigatore.swift
//  BasetaApp
//
//  Created by Eman Gaber on 1/23/22.
//

import UIKit


extension LoginVC {
    
    func moveToForgetPassword(){
        let vc = ForrgetPasswordVC()
        self.present(vc, animated: true, completion: nil)
    }

    func moveToRegister(){
        let vc = RegisterVC()
        self.present(vc, animated: true, completion: nil)

    }
    
//    func SecurePassword(){
//        passwordTf.isSecureTextEntry = !passwordTf.isSecureTextEntry
//    
//        if passwordTf.isSecureTextEntry
//        {
//            btnPassSecure.setImage(UIImage.init(systemName: "eye.slach"), for: .normal)
//        }else
//        {
//            btnPassSecure.setImage(UIImage.init(systemName: "eye"), for: .normal)
//        }
//    }
}
