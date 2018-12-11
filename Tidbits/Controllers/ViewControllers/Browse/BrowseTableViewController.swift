//
//  BrowseTableViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class BrowseTableViewController: UITableViewController {

    //Mark: Outlets
    @IBOutlet weak var searchbar: UISearchBar!
    
       var posts: [Post]?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.posts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? BrowseTableViewCell else { return UITableViewCell()}
        guard let post = self.posts?[indexPath.row] else { return UITableViewCell() }
        cell.post = post
        
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
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        PostController.shared.fetchImageFor(post: post) { (postImage) in
            cell.postImage = postImage
        }
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC"{
            guard let destinationVC = segue.destination as? BrowseDetailViewController else { return }
            let indexPath = tableView.indexPathForSelectedRow
            let hack = PostController.shared.posts?[indexPath?.row ?? 0]
            destinationVC.post = hack
        }
    }

}

extension BrowseTableViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        tableView.reloadData()
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}
