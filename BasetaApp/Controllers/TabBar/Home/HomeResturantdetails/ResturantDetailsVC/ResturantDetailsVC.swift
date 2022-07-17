//
//  ResturantDetailsVC.swift
//  BasetaApp
//
//  Created by Eman Gaber on 2/7/22.
//

import UIKit
import ImageSlideshow
import SDWebImage

class ResturantDetailsVC: UIViewController {
    @IBOutlet var header: AuthHeader!
    @IBOutlet weak var itemsTable:UITableView!
    @IBOutlet weak var typesCollection:UICollectionView!
    @IBOutlet weak var slideshowVC:UIView!
    @IBOutlet weak var pageIndicator:UIPageControl!

    let slideshow = ImageSlideshow()

    override func viewDidLoad() {
        super.viewDidLoad()
        header.btnShare.isHidden = false
        header.delegate = self
        
        setupCollection()
        setupTableVC()
        showBanerImgs()
    }
    
    func setupCollection()
    {
        typesCollection.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        typesCollection.delegate = self
        typesCollection.dataSource = self
        
        
    }
    
    func setupTableVC()
    {
        itemsTable.register(UINib(nibName: ResturantsCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ResturantsCell.reuseIdentifier)
        itemsTable.delegate = self
        itemsTable.dataSource = self
    }
    func showBanerImgs()
    {
        var imagesInputSources = [InputSource]()
        
        
        for _ in 0...5 {
            if let imageUrl = URL(string: "https://i.picsum.photos/id/216/200/300.jpg?hmac=c3OXbiUxWPMgwnaFpX8ZAfBL5TZzWjnof6mb4OwuSPs") {
                imagesInputSources.append(SDWebImageSource(url: imageUrl))
            }
        }
        
//        for model in banners! {
//            guard  model.Picture != nil else {
//                return
//            }
//            let imageEndPoint = APIs.Instance.imagesEndPoint + model.Picture!
//            if let imageUrl = URL(string: imageEndPoint) {
//                imagesInputSources.append(SDWebImageSource(url: imageUrl))
//            }
//        }
        
        createSlideShow(inputSources: imagesInputSources)
        
    }
    
    func createSlideShow(inputSources: [InputSource]) {
        slideshow.frame = slideshowVC.frame
        slideshow.slideshowInterval = 2
        slideshow.contentScaleMode = .scaleAspectFill
        slideshow.setImageInputs(inputSources)
        
        slideshow.cornerRadius = 10
        slideshow.clipsToBounds = true
        slideshow.pageIndicator = pageIndicator
        
        slideshowVC.addSubview(slideshow)
        slideshow.center = slideshowVC.center

//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTap))
//        slideshow.addGestureRecognizer(gestureRecognizer)
        
    }
    
}
extension ResturantDetailsVC:AuthHeaderDelegate
{
    func dismiss() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func share() {
        
    }
}


