//
//  OneOrderCell.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/23/22.
//

import UIKit

class OneOrderCell: UITableViewCell {
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension OneOrderCell: ReuseIdentifying {}
