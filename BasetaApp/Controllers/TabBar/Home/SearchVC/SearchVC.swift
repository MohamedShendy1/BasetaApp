//
//  SearchVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/13/22.
//

import UIKit

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchCollection:UICollectionView!
    @IBOutlet weak var searchtable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupTableVC()
    }

    @IBAction func dismiss (_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }


}
