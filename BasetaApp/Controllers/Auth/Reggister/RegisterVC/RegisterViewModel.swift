//
//  LoginViewModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 1/23/22.
//

import UIKit

protocol RegisterViewModelDelegate: class {
    func showLoading()
    func killLoading()
    func connectionFailed()
    func showErrorAlert(error:String)
    func registerSuccessfully(code:Int)
   
}

class RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    init(delegate:RegisterViewModelDelegate?) {
        self.delegate = delegate
    }
}
