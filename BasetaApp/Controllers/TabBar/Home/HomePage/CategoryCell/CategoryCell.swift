//
//  CategoryCell.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/6/22.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var img:UIImageView!{
        didSet{
            img.layer.cornerRadius = 45
            img.clipsToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
