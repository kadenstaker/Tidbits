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
    @IBOutlet weak var customTabbar1: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
        
        PostController.shared.fetchPosts { (success) in
            //Activity loading thing goes in here
        }
    }

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

