//
//  OtpTextField.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/4/22.
//

import Foundation
import UIKit
class OTPTextField: UITextField {
  weak var previousTextField: OTPTextField?
  weak var nextTextField: OTPTextField?
  override public func deleteBackward(){
    text = ""
    previousTextField?.becomeFirstResponder()
   }
}
