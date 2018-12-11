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
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return self.posts?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? BrowseTableViewCell else { return UITableViewCell()}
        guard let post = self.posts?[indexPath.row] else { return UITableViewCell() }
        // Configure the cell...
        cell.post = post

        return cell
    }

    //toDetailVC
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
}
