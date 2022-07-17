//
//  ForrgetPasswordVC.swift
//  ClinicsApp
//
//  Created by Eman Gaber on 1/31/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ForrgetPasswordVC: UIViewController {
    @IBOutlet weak var header:AuthHeader!
    
    @IBOutlet var emailTf: MDCBaseTextField!{
        didSet {
            emailTf.placeholder = "email"
            emailTf.label.text = "email"
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        setheader()
    }
    @IBAction func ConfirmTapped(_ sender: UIButton){
   let vc = ConfirmOTPVC()
    self.present(vc, animated: true, completion: nil)

    }
    
}
extension ForrgetPasswordVC:AuthHeaderDelegate{
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
}
