//
//  AddressListViewModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 13/05/2022.
//

import UIKit
import Foundation
import PKHUD

protocol AddressListViewModelDelegate: class {
    func showLoading()
    func killLoading()
    func connectionFailed()
    func getAddressesSuccessfully(address:[AddressModel]?)

}

class AddressListViewModel {
    weak var delegate: AddressListViewModelDelegate?
    init(delegate:AddressListViewModelDelegate?) {
        self.delegate = delegate
    }

    
    var addressArr:[AddressModel]?
    
    func getUserAddressApi(userId:Int) {
        self.delegate?.showLoading()
        NetworkManger.getUserAddressApi(userId:userId){ [self] (data, error) in
            self.delegate?.killLoading()
            
            if error == nil && data == nil {
                print("Connection failed")
                self.delegate?.connectionFailed()
                
            } else if (error != nil)  {
                
                HUD.flash(.label(error?.localizedDescription ?? ""), delay: 0.5)
                
            } else if (data?.status == 0){
                HUD.flash(.label(data?.message ?? ""), delay: 0.5)
                
            }
            else if (data?.status == 1){
                addressArr = data?.data
                delegate?.getAddressesSuccessfully(address: addressArr ?? [])
            }
        }
    }
   
}
