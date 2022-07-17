//
//  UIViewX.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/5/22.
//

import Foundation
import UIKit

@IBDesignable

class UIViewX: UIView {

    
    // MARK: - Gradient
    
    @IBInspectable var firstColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var secondColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var horizontalGradient: Bool = false {
        didSet {
            updateView()
        }
    }
    
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let layer = self.layer as! CAGradientLayer
        layer.colors = [ firstColor.cgColor, secondColor.cgColor ]
        
        if (horizontalGradient) {
            layer.startPoint = CGPoint(x: 0.0, y: 0.5)
            layer.endPoint = CGPoint(x: 1.0, y: 0.5)
        } else {
            layer.startPoint = CGPoint(x: 0, y: 0)
            layer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    
    // MARK: - Border
    
    @IBInspectable public var borderColor1: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor1.cgColor
        }
    }
    
    @IBInspectable public  override var borderWidth: CGFloat {
        willSet {

        }

        didSet {
            layer.borderWidth = borderWidth

        }
        
    }
    
    @IBInspectable public  override var cornerRadius: CGFloat   {
        willSet {

        }
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    // MARK: - Shadow
    
    @IBInspectable public   override var shadowOpacity: Float  {
        willSet {

        }
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable public var shadowColor1: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor1.cgColor
        }
    }
    
    @IBInspectable public  override var shadowRadius: CGFloat   {
        willSet {

        }
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
}

extension UIView {

  // OUTPUT 1
    
    func addShadow_(parentview:UIView){
        parentview.layer.shadowColor = #colorLiteral(red: 0.8745098039, green: 0.8862745098, blue: 0.9058823529, alpha: 1)
        parentview.layer.masksToBounds = false
              
        //for bottom shadow on view
                let sizebottom = CGSize(width:0, height:1.0)
                parentview.layer.shadowOffset = sizebottom
                parentview.layer.shadowOpacity = 0.7
                parentview.layer.shadowRadius = 1.0
    }
    
    
    
}
