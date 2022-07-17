//
//  RegisterVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 1/23/22.
//

import UIKit
import DropDown
import MaterialComponents.MaterialTextControls_OutlinedTextAreas
import MaterialComponents.MaterialTextControls_OutlinedTextFields

class RegisterVC: UIViewController {
    
    let dropDown = DropDown()
    @IBOutlet var header: AuthHeader!
    
    @IBOutlet var btncam: UIButton!{
        didSet{
            btncam.layer.cornerRadius = 13
            btncam.clipsToBounds = true
        }
    }
    @IBOutlet var userImg: UIImageView!{
        didSet {
            userImg.layer.cornerRadius = 45
            userImg.clipsToBounds = true
            userImg.layer.borderWidth = 0.02
            userImg.layer.borderColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
            userImg.clipsToBounds = true
            userImg.image  = #imageLiteral(resourceName: "face-id")
        }
    }
    @IBOutlet var imgView: UIView!
    @IBOutlet var firstNameTf: MDCOutlinedTextField!{
        didSet{
            firstNameTf.placeholder = "First name"
            firstNameTf.label.text = "First name"
        }
    }
    @IBOutlet var lastNameTf: MDCOutlinedTextField!{
        didSet
        {
            lastNameTf.placeholder = "Last name"
            lastNameTf.label.text = "Last name"
        }
    }
    @IBOutlet var emailTf: MDCOutlinedTextField!{
        didSet{
            emailTf.placeholder = "Email"
            emailTf.label.text = "Email"
        }
    }

    @IBOutlet var passwordTf: MDCOutlinedTextField!{
        didSet{
            passwordTf.placeholder  = "Password"
            passwordTf.label.text = "Password"
        }
    }
    @IBOutlet var confirmPasswordTf: MDCOutlinedTextField!{
        didSet{
            confirmPasswordTf.placeholder  = "ConfirmPassword"
            confirmPasswordTf.label.text = "ConfirmPassword"
        }
    }
    @IBOutlet var RegisterBtn: UIButtonX!{
        didSet{
            RegisterBtn.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var lblTermsAndConditions:UILabel!
    
    
    @IBOutlet weak var lblTerms: UILabel!{
        didSet {
            
            let sentence = "By clicking Create new account, you agree to the following terms and conditions without reservation"
            let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),.foregroundColor: UIColor.black]
            let largeAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15),.foregroundColor:UIColor.init(named: "lightBlue")]
            let attributedSentence = NSMutableAttributedString(string: sentence, attributes: regularAttributes)
            attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 59, length: 20))
            lblTerms.attributedText = attributedSentence
            lblTerms.isUserInteractionEnabled = true

            lblTerms.isUserInteractionEnabled = true
            lblTerms.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))

            
        }
    }
    
    @IBOutlet weak var lblSigninTapped: UILabel!{
        didSet {
            let sentence = "Already have an account? sign in"
            let regularAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),.foregroundColor: UIColor.black]
            let largeAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),.foregroundColor:UIColor.init(named: "lightBlue")]
            let attributedSentence = NSMutableAttributedString(string: sentence, attributes: regularAttributes)
            attributedSentence.setAttributes(largeAttributes, range: NSRange(location: 25, length: 7))
            
           
            lblSigninTapped.attributedText = attributedSentence
            lblSigninTapped.isUserInteractionEnabled = true

            lblSigninTapped.isUserInteractionEnabled = true
            lblSigninTapped.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapSignIn(gesture:))))
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        header.delegate = self
        setHeader()
    }
    
    @IBAction func CityMenueTapped(_ sender:UIButton){
         dropDown.dataSource = ["Tomato soup", "Mini burgers", "Onion rings", "Baked potato", "Salad"]//4
         dropDown.anchorView = sender //5
         dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
         dropDown.show() //7
         dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
           guard let _ = self else { return }
           sender.setTitle(item, for: .normal) //9
         
       }
    }

    
    
}


extension RegisterVC:AuthHeaderDelegate {
    func dismiss() {
        
    }
    
    
}




