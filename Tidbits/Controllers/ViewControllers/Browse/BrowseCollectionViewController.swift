//
//  BrowseCollectionViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectCell"

class BrowseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var customCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    // MARK: UICollectionViewDataSource


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
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
        cell.layer.cornerRadius = 20
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.borderColor = UIColor.white.cgColor
        cell.contentView.layer.borderWidth = 5
        cell.contentView.layer.backgroundColor = UIColor.white.cgColor
        cell.backgroundColor = UIColor.white
        //        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false
//                cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
//                cell.layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
    
        // Configure the cell
    
        return cell
    }
}
