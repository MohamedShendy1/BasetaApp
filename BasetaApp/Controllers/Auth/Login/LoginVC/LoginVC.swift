//
//  LoginVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 1/23/22.
//

import UIKit

import UIKit
import MaterialComponents.MaterialTextControls_FilledTextAreas
import MaterialComponents.MaterialTextControls_FilledTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields
class LoginVC: UIViewController {
    
    @IBOutlet var passwordTf: MDCOutlinedTextArea!{
        didSet{
            passwordTf.placeholder = "passworrd"
            passwordTf.label.text = "passworrd"
        }
    }
    
    @IBOutlet var useNameTf: MDCOutlinedTextField!{
        didSet {
            useNameTf.placeholder = "user name"
            useNameTf.label.text = "user name"
        }
    }
    @IBOutlet weak var btnPassSecure:UIButton!{
        didSet{
            btnPassSecure.setImage(UIImage.init(named: "eye.slash"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func registerTapped(_ sender: UIButton){
        moveToRegister()
    }
    
    
    
    @IBAction func ForgetPasswordTapped(_ sender: UIButton){
        moveToForgetPassword()
    }
    
    
    
}
