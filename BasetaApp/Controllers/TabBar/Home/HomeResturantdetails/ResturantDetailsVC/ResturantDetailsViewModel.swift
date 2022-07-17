//
//  ResturantDetailsViewModel.swift
//  BasetaApp
//
//  Created by Eman Gaber on 4/20/22.
//

//import UIKit
//import Foundation
//import PKHUD
//
//protocol ResturantDetailsViewModelDelegate: class {
//    func showLoading()
//    func killLoading()
//    func connectionFailed()
//    func getBannersArraySuccessfully()
//    func getResturantCategoriesSuccessfully()
//    func getResturantItemsSuccessfully()
//}
//
//class ResturantDetailsViewModel {
//    weak var delegate: ResturantDetailsViewModelDelegate?
//    init(delegate:ResturantDetailsViewModelDelegate?) {
//        self.delegate = delegate
//    }
//    var bannersArr:[BannerModel]?
//    var categoriesArr:[Category]?
//    var itemsArr:[ResturantItemModel]?
//
//    func getResturantBannersApi(branchId:Int) {
//        self.delegate?.showLoading()
//        NetworkManger.getResturantBannersApi(branchId: branchId){ [self] (data, error) in
//            self.delegate?.killLoading()
//            
//            if error == nil && data == nil {
//                print("Connection failed")
//                self.delegate?.connectionFailed()
//                
//            } else if (error != nil)  {
//                
//                HUD.flash(.label(error?.localizedDescription ?? ""), delay: 0.5)
//                
//            } else if (data?.status == 0){
//                HUD.flash(.label(data?.message ?? ""), delay: 0.5)
//                
//            }
//            else if (data?.status == 1){
//                bannersArr = data?.data
//                delegate?.getBannersArraySuccessfully()
//            }
//        }
//    }
//    
//    func getResturantCategoriesApi(branchId:Int) {
//        self.delegate?.showLoading()
//        NetworkManger.getResturantCategoriesApi(branchId: branchId){ [self] (data, error) in
//            self.delegate?.killLoading()
//            
//            if error == nil && data == nil {
//                print("Connection failed")
//                self.delegate?.connectionFailed()
//                
//            } else if (error != nil)  {
//                
//                HUD.flash(.label(error?.localizedDescription ?? ""), delay: 0.5)
//                
//            } else if (data?.status == 0){
//                HUD.flash(.label(data?.message ?? ""), delay: 0.5)
//                
//            }
//            else if (data?.status == 1){
//                categoriesArr = data?.data
//                delegate?.getResturantCategoriesSuccessfully()
//            }
//        }
//    }
//    
//    func getResturantItemsApi(branchId: Int,catId:Int) {
//        self.delegate?.showLoading()
//        NetworkManger.getResturantItemsApi(branchId: branchId, catId:catId){ [self] (data, error) in
//            self.delegate?.killLoading()
//            
//            if error == nil && data == nil {
//                print("Connection failed")
//                self.delegate?.connectionFailed()
//                
//            } else if (error != nil)  {
//                
//                HUD.flash(.label(error?.localizedDescription ?? ""), delay: 0.5)
//                
//            } else if (data?.status == 0){
//                HUD.flash(.label(data?.message ?? ""), delay: 0.5)
//                
//            }
//            else if (data?.status == 1){
//                itemsArr = data?.data?.data
//                delegate?.getResturantItemsSuccessfully()
//            }
//        }
//    }
//    
//}
