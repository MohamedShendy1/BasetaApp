//
//  SearchVC+Delegates.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/13/22.
//

import Foundation
import UIKit
extension SearchVC:UITableViewDelegate,UITableViewDataSource
{
    func setupTableVC()
    {
        searchtable.register(UINib(nibName: SearchCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: SearchCell.reuseIdentifier)
        searchtable.delegate = self
        searchtable.dataSource = self
        searchtable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchVM.searchItemsArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseIdentifier) as! SearchCell
       
        let index = searchVM.searchItemsArr?[indexPath.row] 
        cell.configCell(searchItem:index)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
