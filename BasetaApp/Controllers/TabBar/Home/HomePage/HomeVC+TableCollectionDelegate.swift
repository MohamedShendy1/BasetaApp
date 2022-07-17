//
//  HomeVC+CollectionDelegate.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/5/22.
//

import Foundation
import UIKit
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
        
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == bannersCollection {
            return 10
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == bannersCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBanersCell", for: indexPath) as! HomeBanersCell
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            return cell
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == bannersCollection {
            return CGSize(width: 137, height:173)
        }else{
            return CGSize(width: 116, height:134)
        }
    }
    
    
}

extension HomeVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ResturantsCell.reuseIdentifier) as! ResturantsCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppStoryboard.ResturantDetails.viewController(viewControllerClass:ResturantDetailsVC.self)

        self.navigationController?.pushViewController(vc, animated: true)

    }
}
