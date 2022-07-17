//
//  SelectOrderDetails+CollectionDelegate.swift
//  BasetaApp
//
//  Created by Eman Gaber on 3/19/22.
//

import Foundation
import UIKit
extension SelectedItemDetailsVC:UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollection()
    {
        relatedItemsCollection.register(UINib(nibName: "SelectedItemCell", bundle: nil), forCellWithReuseIdentifier: "SelectedItemCell")
        relatedItemsCollection.delegate = self
        relatedItemsCollection.dataSource = self
        
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
  
            return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectedItemCell", for: indexPath) as! SelectedItemCell
            return cell
               
        }
        
        
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 120, height:130)
    }
    
    
}
extension SelectedItemDetailsVC:UITableViewDelegate,UITableViewDataSource{
   
    func setupTableVC()
    {
        addonsTable.register(UINib(nibName: ResturantsCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ResturantsCell.reuseIdentifier)
        addonsTable.delegate = self
        addonsTable.dataSource = self
        addonsTable.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
