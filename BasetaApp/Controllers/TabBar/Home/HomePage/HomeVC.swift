//
//  HomeVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/5/22.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak  var bannersCollection:UICollectionView!
    @IBOutlet weak  var resturantsTable:UITableView!
    @IBOutlet weak  var categoryCollection:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupTableVC()
        
    }
    
    func setupCollection()
    {
        categoryCollection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        categoryCollection.delegate = self
        categoryCollection.dataSource = self
        
        bannersCollection.register(UINib(nibName: "HomeBanersCell", bundle: nil), forCellWithReuseIdentifier: "HomeBanersCell")
        bannersCollection.delegate = self
        bannersCollection.dataSource = self
        
    }
    
    func setupTableVC()
    {
        resturantsTable.register(UINib(nibName: ResturantsCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ResturantsCell.reuseIdentifier)
        resturantsTable.delegate = self
        resturantsTable.dataSource = self
    }
    

}
