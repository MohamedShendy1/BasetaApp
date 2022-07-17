//
//  SplashVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/4/22.
//


import UIKit
import RevealingSplashView

class SplashVC: UIViewController {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        revalsSplash()
        
        
    }

    
    func revalsSplash(){
    
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "Logo")!,iconInitialSize: CGSize(width: screenWidth/1.5, height: screenWidth/1.5), backgroundColor: UIColor.white)
    
            revealingSplashView.frame = CGRect(x: 0, y: 0, width: screenWidth/1.4, height: screenWidth/2.2)
    
            self.view.addSubview(revealingSplashView)
    
            //Starts animation
            revealingSplashView.startAnimation(){
                revealingSplashView.animationType = SplashAnimationType.heartBeat

                    
                self.openLoginVc()
    
            }
    }
    
    func openLoginVc(){
        let vc = LoginVC()
        self.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }

}

