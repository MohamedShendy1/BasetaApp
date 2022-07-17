//
//  CartCell.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/11/22.
//

import UIKit

class CartCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CartCell: ReuseIdentifying {}
