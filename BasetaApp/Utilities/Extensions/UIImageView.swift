//
//  UIImageView.swift
//  Drovox Passenger
//
//  Created by Eman Gaber on 2/26/21.
//

import Foundation
import UIKit
import SDWebImage


extension UIImageView {
    func loadImage(path: String, placeHolderImage: UIImage? = nil, withTintColor: UIColor? = nil, cornerRadius: CGFloat? = nil, borderWidth: CGFloat? = nil, borderColor: UIColor? = nil, isTemplateImage:Bool = false, scaleToImageSize: Bool = false) {
        

//        let activityIndicator = SDWebImageActivityIndicator()
//        //        activityIndicator.indicatorView.style = .whiteLarge
//        activityIndicator.indicatorView.color = .orange
//        self.sd_imageIndicator = activityIndicator
//        self.sd_imageIndicator?.startAnimatingIndicator()
        let transformer = SDImageResizingTransformer(size: self.frame.size, scaleMode: .aspectFit)

        guard let encoded = path.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let url = URL(string: encoded) else {
                return
        }
        
        
        self.sd_setImage(with: url, placeholderImage: placeHolderImage, options: [.highPriority, .continueInBackground, .scaleDownLargeImages], context: scaleToImageSize ? [.imageTransformer: transformer] : nil, progress: nil) { (image, error, _, _) in
            DispatchQueue.main.async {
//                self.sd_imageIndicator?.stopAnimatingIndicator()
                if error == nil {
                    if let tintColor = withTintColor {
                        let tintedImage = image?.withRenderingMode(.alwaysTemplate)
                        self.image = tintedImage
                        self.tintColor = tintColor.withAlphaComponent(1)
                        
                    } else {
                        self.image = image
                    }
                }
            }
        }
        
       if let radius = cornerRadius {
            self.layer.masksToBounds = false
            self.layer.cornerRadius = radius
            self.clipsToBounds = true
        }
        
        if let borderWidth = borderWidth {
            self.layer.masksToBounds = false
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = (borderColor ?? UIColor.clear).cgColor
            self.clipsToBounds = true
        }
    }
    
    func changePngColorTo(color: UIColor?){
        guard let image =  self.image else {return}
        if let color = color {
            self.image = image.withRenderingMode(.alwaysTemplate)
            self.tintColor = color
        } else {
            self.image = image.withRenderingMode(.alwaysOriginal)
        }
    }
}

extension UIImage {
    func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: size, format: format).image { _ in
            color.set()
            withRenderingMode(.alwaysTemplate).draw(at: .zero)
        }
    }
    
    
    func maskWithColor(color: UIColor) -> UIImage {
           UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
           let context = UIGraphicsGetCurrentContext()!

           let rect = CGRect(origin: CGPoint.zero, size: size)

           color.setFill()
           self.draw(in: rect)

           context.setBlendMode(.sourceIn)
           context.fill(rect)

           let resultImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           return resultImage
       }

   
}
