//
//  OredrVC+delegate.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/23/22.
//

import Foundation
import UIKit

extension OrdersVC:UITableViewDelegate,UITableViewDataSource{
    
    func setupTable()
    {
        orderTable.register(UINib(nibName: OrderCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: OrderCell.reuseIdentifier)
     
        orderTable.register(UINib(nibName: OneOrderCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: OneOrderCell.reuseIdentifier)
        
        
        orderTable.delegate = self
        orderTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return 5
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row ==  1 {

            let cell = tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseIdentifier) as! OrderCell

            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: OneOrderCell.reuseIdentifier) as! OneOrderCell
            return cell

        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        openOrderDetails()
    }
    
    
    func openOrderDetails(){
        let vc = OrderDetailsVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
