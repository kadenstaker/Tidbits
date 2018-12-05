//
//  BrowseCollectionViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

private let reuseIdentifier = "tidbitCell"

class BrowseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var customCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        customCollectionView.delegate = self
//        customCollectionView.dataSource = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tidbitCell", for: indexPath) as? BrowseCollectionViewCell else { return UICollectionViewCell()}
//        guard let post = PostController.shared.posts?[indexPath.row] else { return UICollectionViewCell()}
//        //Instead of making the post in the postController an optional array, make it an array = []
//        cell.categoryNameLabel.text = post.category
//        cell.numberOfItemLabel.text = "\(PostController.shared.posts?.count ?? 0)"
        _ = indexPath.item
        cell.layer.cornerRadius = 20
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.borderColor = UIColor.cyan.cgColor
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

    // MARK: UICollectionViewDelegate


    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
