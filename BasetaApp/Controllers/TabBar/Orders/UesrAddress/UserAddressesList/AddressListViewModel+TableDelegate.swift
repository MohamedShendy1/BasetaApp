//
//  AddressListViewModel+Delegate.swift
//  BasetaApp
//
//  Created by Eman Gaber on 13/05/2022.
//

import Foundation
import UIKit
import AnimatableReload

extension AddressListVC :UITableViewDelegate,UITableViewDataSource{

    func setupTable()
    {
        addressTable.register(UINib(nibName: AddressCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: AddressCell.reuseIdentifier)
        addressTable.delegate = self
        addressTable.dataSource = self
        addressTable.reloadData()
        AnimatableReload.reload(tableView: addressTable, animationDirection: "down")
        
        
    }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  addressListVM.addressArr?.count ?? 0
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressCell.reuseIdentifier) as! AddressCell
        
        let item = addressListVM.addressArr?[indexPath.row]
        cell.configerCell(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = addressListVM.addressArr?[indexPath.row]
        let address = "\(item?.address ?? "" + (item?.building ?? "") + (item?.landmark ?? ""))"
        let lang = "\(item?.lang)"
        let lat = "\(String(describing: item?.lat))"
        let landmark = "\(String(describing: item?.landmark))"
        let building = "\(String(describing: item?.building))"
        let pinCode = "\(String(describing: item?.pincode))"

        
        NotificationCenter.default.post(name: Notification.Name("selectCartToAddress"),object: nil,userInfo: ["selectedAddress":address,"lang":lang,"lat":lat,"landmark":landmark,"building":building,"pinCode":pinCode])
        
        self.dismiss(animated: true, completion: nil)

        
    }
    
    
}
