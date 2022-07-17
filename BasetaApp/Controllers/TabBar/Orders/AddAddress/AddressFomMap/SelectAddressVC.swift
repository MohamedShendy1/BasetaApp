//
//  SelectAddressVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 29/05/2022.
//

import Foundation
import MapKit
import UIKit
import SCLAlertView

class SelectAddressVC: UIViewController,UIGestureRecognizerDelegate,CLLocationManagerDelegate,MKMapViewDelegate, AuthHeaderDelegate  {
    let locationManager = CLLocationManager()
       var selected_latitude = ""
       var selected_longitude = ""
       var selectedAddress = ""
       var selectedCity = ""
      let regioninMeters:Double = 80000
    @IBOutlet weak var header: AuthHeader!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var mapView: MKMapView!

    @IBOutlet weak var lblAddress: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        header.titleLbl.text = "حدد موقعك"

        mapView.delegate = self

        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        
        
        let tgr = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler(_:)))
        tgr.delegate = self
        mapView.addGestureRecognizer(tgr)


        mapView.showsUserLocation = true
        mapView.showAnnotations(mapView.annotations, animated: true)
        
        mapView.mapType = .standard
//
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        }
        locationManager.startUpdatingLocation()
        
        
    }
    @objc func tapGestureHandler(_ tgr: UITapGestureRecognizer?) {
           let touchPoint: CGPoint? = tgr?.location(in: mapView)
           
           let touchMapCoordinate: CLLocationCoordinate2D = mapView.convert(touchPoint ?? CGPoint.zero, toCoordinateFrom: mapView)
           
           var myCoordinate1: CLLocationCoordinate2D = CLLocationCoordinate2D()
           myCoordinate1.longitude = touchMapCoordinate.longitude
           myCoordinate1.latitude = touchMapCoordinate.latitude
           
           
            getAddressFromLatLon(pdblLatitude: "\(touchMapCoordinate.latitude)", withLongitude: "\(touchMapCoordinate.longitude)")
       
        addPin(myCoordinate1.latitude, myCoordinate1.longitude, "")

        
        selected_latitude = "\(touchMapCoordinate.latitude)"
        selected_longitude = "\(touchMapCoordinate.longitude)"
        
        
           
               }
          
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let loc = locations[0]
            let lat = loc.coordinate.latitude
            let lng = loc.coordinate.longitude
            selected_latitude = "\(lat)"
            selected_longitude = "\(lng)"
            getAddressFromLatLon(pdblLatitude: "\(lat)", withLongitude: "\(lng)")
            
        
            
            
            addPin(lat, lng, NSLocalizedString("My current location", comment: ""))
            locationManager.stopUpdatingLocation()
        
        }
    
    func addPin(_ lat:Double,_ lng:Double,_ til:String = "" ){
        
        let point = StarbucksAnnotation(coordinate: CLLocationCoordinate2D(latitude: lat , longitude:lng ))
        
        if let location = locationManager.location?.coordinate{
            
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regioninMeters, longitudinalMeters: regioninMeters)
            
            mapView.setRegion(region, animated: true)
            
        }
        
        mapView.removeAnnotations(mapView.annotations)
        
        mapView.addAnnotation(point)
        self.mapView.selectAnnotation(point, animated: true)

    }
    
    //MARK: - Custom Annotation
       func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
       {
           
           if annotation is MKUserLocation
           {
               return nil
           }else
           {
               
               var annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
               if annotationView == nil{
                   annotationView = AnnotationView(annotation: annotation, reuseIdentifier: "Pin")
                   annotationView?.canShowCallout = false
               }else{
                   annotationView?.annotation = annotation
               }
               annotationView?.image = UIImage.init(named: "")
          
         
               return annotationView
           }
       }
       
       func mapView(_ mapView: MKMapView,
                    didSelect view: MKAnnotationView)
       {

           if view.annotation is MKUserLocation
           {
               // Don't proceed with custom callout
               return
           }
           else
           {

               let NibNamed = "CustomCalloutView2"

               // 2
               let views = Bundle.main.loadNibNamed(NibNamed, owner: nil, options: nil)

               let calloutView = views?[0] as! CustomCalloutView2


               calloutView.btnZoom.addTarget(self, action: #selector(zoomInButtonClicked), for: .allTouchEvents)
            
            
               calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
               view.addSubview(calloutView)
               mapView.setCenter((view.annotation?.coordinate)!, animated: true)


           }
       }
    
    
    @objc func zoomInButtonClicked() {
            let span = MKCoordinateSpan(latitudeDelta: mapView.region.span.latitudeDelta/100, longitudeDelta: mapView.region.span.longitudeDelta/100)
            let region = MKCoordinateRegion(center: mapView.region.center, span: span)

            mapView.setRegion(region, animated: true)
        }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("didFailWithError: \(error.localizedDescription )")
        
        let alertController = UIAlertController(title:"Error".localized, message:"Error_locating_location".localized, preferredStyle: .alert)
        let tryAgain = UIAlertAction(title: "try_again".localized, style: .default, handler: {(_ action: UIAlertAction) -> Void in
            self.locationManager.startUpdatingLocation()
        })
        let Cansel = UIAlertAction(title: "no".localized, style: .default, handler: {(_ action: UIAlertAction) -> Void in
            alertController.dismiss(animated: true) {() -> Void in }
        })
        alertController.modalPresentationStyle = .popover
        alertController.addAction(tryAgain)
        alertController.addAction(Cansel)
        present(alertController, animated: false) {() -> Void in }
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
                if placemarks != nil {
                    let pm = placemarks! as [CLPlacemark]
                    
                    if pm.count > 0 {
                        var addressString : String = ""

                        let pm = placemarks![0]
                        if let addrList = pm.addressDictionary?["FormattedAddressLines"] as? [String]
                           {
                            if addrList.count == 0
                            {
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
                            }else
                            {
                            addressString =  addrList.joined(separator: ", ")
                            }
                        }

                        self.selectedAddress = addressString
                        print(addressString)
                        
                        self.lblAddress.text = addressString
                        
                  

                    }
                    
                }
        })
        
    }
      

    
    @IBAction func ConfirmLocation(_ sender: Any) {
        if(selectedAddress == "")
    {

        SCLAlertView().showError("", subTitle: "Plz_select_address")

    }else
        {
    NotificationCenter.default.post(name: Notification.Name("setSelectedAddress"),object: nil,userInfo: ["selectedAddress":self.selectedAddress,"selectedLong": self.selected_longitude ,"selectedLat": self.selected_latitude])
                              
        self.dismiss(animated: true, completion: nil)

}

    
}
}

