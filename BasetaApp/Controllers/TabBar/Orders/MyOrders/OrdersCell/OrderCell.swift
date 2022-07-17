//
//  OrderCell.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/23/22.
//

import UIKit

class OrderCell: UITableViewCell {
    @IBOutlet weak var itemsCollection:UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension OrderCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    
    func setupCollection()
    {
        itemsCollection.register(UINib(nibName: "moreOrderCell", bundle: nil), forCellWithReuseIdentifier: "moreOrderCell")
        itemsCollection.delegate = self
        itemsCollection.dataSource = self
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moreOrderCell", for: indexPath) as! moreOrderCell
            return cell
        }
        
        
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = itemsCollection.frame.width / 2 - 1
        
        
            return CGSize(width: width, height:width)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
extension OrderCell: ReuseIdentifying {}
