//
//  ConfirmOTPVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/4/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ConfirmOTPVC: UIViewController, OTPDelegate {
    func didChangeValidity(isValid: Bool) {
        true
    }
    
    @IBOutlet weak var otpContainerView: UIView!
    @IBOutlet var header: AuthHeader!
    let otpStackView = OTPStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        setupOTPStack()
        setheader()
    }
    

    
    @IBAction func confirmTapped(_ sender: UIButton){
   let vc = ChangePasswordVC()
        self.present(vc, animated: true, completion: nil)
    }

}
extension ConfirmOTPVC:AuthHeaderDelegate{
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
