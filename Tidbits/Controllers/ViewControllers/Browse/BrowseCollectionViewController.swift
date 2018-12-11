//
//  BrowseCollectionViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectCell"

class BrowseCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var customCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BrowseCollectionViewCell else { return UICollectionViewCell()}
        
//         Instead of doing post controller.sh
//        guard let post = PostController.shared.posts?[indexPath.row] else { return UICollectionViewCell()}
//        cell.post = post
//        Instead of making the post in the postController an optional array, make it an array = []
//        cell.categoryNameLabel.text = post.category
//        cell.numberOfItemLabel.text = "\(PostController.shared.posts?.count ?? 0)"
        _ = indexPath.item
        cell.layer.cornerRadius = 10
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        cell.contentView.layer.borderWidth = 5
        cell.contentView.layer.backgroundColor = UIColor.white.cgColor
        cell.backgroundColor = UIColor.white
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 0.2
        cell.layer.masksToBounds = false
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthOfScreen = view.frame.width
        return CGSize(width: (widthOfScreen - 3 * 16) / 2 + 10, height: ((widthOfScreen - 3 * 16) / 2) + 50)
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 16, left: 10, bottom: 50, right: 10)
//    }
    
        // MARK: - Navigation
    
    
}

