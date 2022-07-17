//
//  UITextField.swift
//  Drovox Passenger
//
//  Created by Eman Gaber on 2/24/21.
//

import Foundation
import UIKit

extension UITextField {
    func placeholderColor(color: UIColor) {
        let attributeString = [
            NSAttributedString.Key.foregroundColor: color.withAlphaComponent(0.6),
            NSAttributedString.Key.font: self.font!
        ] as [NSAttributedString.Key : Any]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: attributeString)
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        self.leftViewMode = .always
        self.layer.masksToBounds = true
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.rightViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func addRightOrLeftView(isRight: Bool, imageName: String, transformBy: CGFloat? = nil) {
        //        let eyeIcon = UIButton(type: .custom)
        //        eyeIcon.setImage(showSpecificEyeIcon(isSecure: true), for: .normal)
        //        eyeIcon.frame = CGRect(x: 20, y: 0, width: CGFloat(25), height: CGFloat(25))
        //        eyeIcon.addTarget(self, action: #selector(togglePasswordVisibility(_:)), for: .touchUpInside)
        
        if let existedView = (isRight ? self.rightView : self.leftView) as? UIImageView {
            if let transformBy = transformBy {
                UIView.animate(withDuration: 0.2) {
                    existedView.transform = CGAffineTransform(rotationAngle: transformBy)
                }
            } else {
                existedView.image = UIImage(named: imageName)
            }
        } else {
            let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 30)) // this view to add margin to search icon
            view.image = UIImage(named: imageName)
            view.contentMode = .scaleAspectFit
            
            if isRight {
                self.rightViewMode = .always
                self.rightView = view
            } else {
                self.leftViewMode = .always
                self.leftView = view
            }
        }
    }
}
