//
//  OrdersVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/23/22.
//

import UIKit

class OrdersVC: UIViewController {
    @IBOutlet weak var orderTable:UITableView!
    @IBOutlet weak var header:TabBarHeader!

    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        setupTable()
        setHeaderUI()
        
    }
    


}
extension OrdersVC:TabBarHeaderDelegate {
    
   func setHeaderUI(){
    header.logoWidth.constant = 0
    header.lblTitle.text = "Orders"
    header.lblSlogon.text = "Your Orders"

    }
    func openCart() {
        let vc =  CartVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    func openNotification() {
        let vc =  NotificationVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

