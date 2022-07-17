//
//  ConfirmOTPVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/4/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class ChangePasswordVC: UIViewController {
    @IBOutlet var header: AuthHeader!
    @IBOutlet weak var btnNewPassSecure: UIButton!{
        didSet{
            btnNewPassSecure.setImage(UIImage.init(systemName: "eye.slash"), for: .normal)
        }
        
    }
    @IBOutlet weak var btnConfirmPassSecure: UIButton!{
        didSet{
            btnConfirmPassSecure.setImage(UIImage.init(systemName: "eye.slash"), for: .normal)
        }
    }

    @IBOutlet var newPasswordTF: MDCBaseTextField!{
        didSet{
            newPasswordTF.placeholder = "new password"
            newPasswordTF.label.text = "new password"

        }
    }
    @IBOutlet var ConfirmPasswordTF: MDCBaseTextField!{
        didSet{
            ConfirmPasswordTF.placeholder = "confirm password"
            ConfirmPasswordTF.label.text = "confirm password"
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        setHeader()
        
    }


    @IBAction func passSecureTapped(_ sender: UIButton){
        SecurePassword()
    }
    @IBAction func confirmPassSecureTapped(_ sender: UIButton){
        ConfirmSecurePassword()
    }

}
extension ChangePasswordVC:AuthHeaderDelegate{
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
