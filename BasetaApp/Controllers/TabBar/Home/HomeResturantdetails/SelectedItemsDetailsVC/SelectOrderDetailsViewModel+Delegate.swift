//
//  SelectOrderDetailsViewModel+Delegate.swift
//  BasetaApp
//
//  Created by Eman Gaber on 09/05/2022.
//

import Foundation
extension SelectedItemDetailsVC:SelectedItemViewModelDelegate{
    func showLoading() {
        Dialogs.showLoading()
    }
    
    func killLoading() {
        Dialogs.dismiss()
        
    }
    
    func connectionFailed() {
    showNoInternetAlert()
    }
    
    func getItemsDetailsSuccessfully() {
        
    }
    func setData(){
        
    }
    
    
}
