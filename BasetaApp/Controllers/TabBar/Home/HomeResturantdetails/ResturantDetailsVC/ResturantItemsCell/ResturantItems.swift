//
//  ResturantItems.swift
//  BasetaApp
//
//  Created by Eman Gaber on 3/15/22.
//

import UIKit

class ResturantItemsCell: UITableViewCell {
    @IBOutlet weak var bottomView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bottomView.layer.cornerRadius = 5
        bottomView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ResturantItemsCell: ReuseIdentifying {}
