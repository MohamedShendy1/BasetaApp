//
//  AddressListVC+TableDelegate.swift
//  BasetaApp
//
//  Created by Eman Gaber on 13/05/2022.
//

import Foundation
import UIKit
import MapKit

extension AddressListVC:AddressListViewModelDelegate{
    func showLoading() {
        Dialogs.showLoading()
    }
    
    func killLoading() {
        Dialogs.dismiss()
    }
    
    func connectionFailed() {
        showNoInternetAlert()
    }
    
    
    func getAddressesSuccessfully(address: [AddressModel]?) {
        setupTable()
        setLayout()
    }
    
    
    func getAddressFromLatLon(pdblLatitude: String, withLongitude pdblLongitude: String) {
            var center : CLLocationCoordinate2D = CLLocationCoordinate2D()
            let lat: Double = Double("\(pdblLatitude)")!
            //21.228124
            let lon: Double = Double("\(pdblLongitude)")!
            //72.833770
            let ceo: CLGeocoder = CLGeocoder()
            center.latitude = lat
            center.longitude = lon

            let loc: CLLocation = CLLocation(latitude:center.latitude, longitude: center.longitude)


            ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        print(pm.country)
                        print(pm.locality)
                        print(pm.subLocality)
                        print(pm.thoroughfare)
                        print(pm.postalCode)
                        print(pm.subThoroughfare)
                        var addressString : String = ""
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                        }
                        print(addressString)
                        
                      //  self.lblCity.text = pm.locality
                        
                  }
            })

        }
    
    func setLayout(){
        tableHeight.constant = CGFloat(94 * (addressListVM.addressArr?.count ?? 0))
        viewScrollHeight.constant = tableHeight.constant + 500
        self.loadViewIfNeeded()
    }
}
