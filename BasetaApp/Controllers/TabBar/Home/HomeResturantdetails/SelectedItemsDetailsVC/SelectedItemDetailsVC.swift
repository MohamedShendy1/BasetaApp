//
//  OrderDetailsVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 3/19/22.
//

import UIKit

class SelectedItemDetailsVC: UIViewController {
    @IBOutlet weak var relatedItemsCollection:UICollectionView!
    @IBOutlet weak var addonsTable:UITableView!
    @IBOutlet weak var notesTV:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollection()
        
    }
    @IBAction func dismissVC()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func completeOrder(_ seder:UIButtonX){
        let vc = CompleteOrder()
        
        let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
        print((keyWindow?.frame.size.height)!)
        
        let popupHeight = CGFloat((keyWindow?.frame.size.height)! * 0.50)
       
        let options = SheetOptions(
            pullBarHeight: 20,
            cornerRadius: 10,
            useFullScreenMode: false,
            shrinkPresentingViewController: false,
            useInlineMode: false
        )

        let sheetController = SheetViewController(controller: vc, sizes: [SheetSize.fixed(popupHeight)], options: options)
        sheetController.overlayColor = UIColor.black.withAlphaComponent(0.6)
        self.present(sheetController, animated: true, completion: nil)
        

    }
    
    
    
}
