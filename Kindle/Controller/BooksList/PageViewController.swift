//
//  PageViewController.swift
//  Kindle
//
//  Created by Luiz Hammerli on 23/12/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class PageViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var book:Book?
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = .white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: UIBarButtonItemStyle.plain, target: self, action: #selector(closeViewController))
        
        let layout = self.collectionView?.collectionViewLayout  as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        self.collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView?.isPagingEnabled = true
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.navigationItem.title = book?.name
    }
    
    @objc func closeViewController(){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView:  UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height - 44 - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageCell
        cell.pageLabel.text = book?.pages[indexPath.item].text
        
        return cell
    }
}
