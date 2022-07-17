//
//  AddressListVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 13/05/2022.
//

import UIKit
import Presentr

class AddressListVC: UIViewController {
    
    @IBOutlet weak var addressTable:UITableView!
    @IBOutlet weak var tableHeight:NSLayoutConstraint!
    @IBOutlet weak var viewScrollHeight:NSLayoutConstraint!
    
    var addressListVM:AddressListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        addressListVM = AddressListViewModel(delegate: self)
        getUserAddressApi(userId:31)
        
    }
    
    func getUserAddressApi(userId:Int){
        addressListVM.getUserAddressApi(userId:userId)
    }
    
    
    @IBAction func openAddAddressVc(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: Notification.Name("openAddAddessVC"),object: nil,userInfo:nil)
       
    }
    



}
