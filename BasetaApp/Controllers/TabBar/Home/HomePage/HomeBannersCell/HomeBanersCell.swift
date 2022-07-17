//
//  HomeBanersCell.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/5/22.
//

import UIKit

class HomeBanersCell: UICollectionViewCell {
    @IBOutlet weak var viewImg:UIView!{
        didSet{
            viewImg.layer.cornerRadius = 10
            viewImg.clipsToBounds = true
        }
    }

    @IBOutlet weak var img:UIImageView!{
        didSet{
            img.layer.cornerRadius = 10
            img.clipsToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
