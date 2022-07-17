//
//  SelectedItemDetailsViewModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 09/05/2022.
//
import UIKit
import Foundation
import PKHUD

protocol SelectedItemViewModelDelegate: class {
    func showLoading()
    func killLoading()
    func connectionFailed()
    func getItemsDetailsSuccessfully()
}

class SelectedItemViewModel {
    weak var delegate: SelectedItemViewModelDelegate?
    init(delegate:SelectedItemViewModelDelegate?) {
        self.delegate = delegate
    }
    var bannersArr:[BannerModel]?
    var categoriesArr:[Category]?
    var itemsArr:[ResturantItemModel]?


    
    func getResturantItemsApi(branchId: Int,catId:Int) {
        self.delegate?.showLoading()
        NetworkManger.getResturantItemsApi(branchId: branchId, catId:catId){ [self] (data, error) in
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
                itemsArr = data?.data?.data
                delegate?.getItemsDetailsSuccessfully()
            }
        }
    }
    
}
