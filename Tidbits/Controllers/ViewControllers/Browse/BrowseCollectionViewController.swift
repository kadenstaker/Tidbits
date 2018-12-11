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
        PostController.shared.fetchPosts { (success) in
            //Activity loading thing goes in here
        }
    }

    // MARK: - Navigation

    // MARK: UICollectionViewDataSource


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
         return PostController.shared.categories.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? BrowseCollectionViewCell,
            let destinationVC = segue.destination as? BrowseTableViewController else { return }
        switch cell.restorationIdentifier {
        case "All":
            destinationVC.posts = PostController.shared.posts
        case "Health":
            destinationVC.posts = PostController.shared.healthPosts
        case "Food":
            destinationVC.posts = PostController.shared.foodPosts
        case "Money":
            destinationVC.posts = PostController.shared.moneyPosts
        case "Tech":
            destinationVC.posts = PostController.shared.techPosts
        case "Funny":
            destinationVC.posts = PostController.shared.funnyPosts
        case "Party":
            destinationVC.posts = PostController.shared.partyPosts
        case "Favorite":
            destinationVC.posts = PostController.shared.favoritePosts
        default:
            print("Something went wrong")
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? BrowseCollectionViewCell else { return UICollectionViewCell()}
        let category = PostController.shared.categories[indexPath.row]
        cell.category = category
        cell.restorationIdentifier = category
        
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
