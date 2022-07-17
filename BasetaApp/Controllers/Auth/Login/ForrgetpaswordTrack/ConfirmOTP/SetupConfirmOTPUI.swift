//
//  SetupUI.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/4/22.
//

import Foundation
extension ConfirmOTPVC {
    func setheader(){
        header.titleLbl.text = "Confirm"
    }
    
    func setupOTPStack(){
        otpContainerView.addSubview(otpStackView)
        otpStackView.delegate = self
        otpStackView.heightAnchor.constraint(equalTo: otpContainerView.heightAnchor).isActive = true
        otpStackView.centerXAnchor.constraint(equalTo: otpContainerView.centerXAnchor).isActive = true
        otpStackView.centerYAnchor.constraint(equalTo: otpContainerView.centerYAnchor).isActive = true

    }
}

