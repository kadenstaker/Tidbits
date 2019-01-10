//
//  BrowseDetailViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

//Drag out heart button outlet

class BrowseDetailViewController: UIViewController{
    
    
    
    //Mark: - Outlets
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var userTidbit: UILabel!
    @IBOutlet weak var heartB: UIButton!
    @IBOutlet weak var otherButtonTapped: UIButton!
    
    var post: Post?
    var interalUser: InternalUser?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    func updateViews() {
        guard let post = post, let internalUser = interalUser else { return }
        detailImageView.image = post.image
        userTidbit.text = "\(internalUser.username) & \(post.text)"
        
        if post.isFavorited {
            heartB.setImage(#imageLiteral(resourceName: "iconfinder_Instagram_UI-07_2315589"), for: .normal)
        }else{
            heartB.setImage(#imageLiteral(resourceName: "defaultHeart"), for: .normal)
        }
    }
    
    //MARK: - Actions
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        guard let post = post, let interalUser = interalUser else { return }
        PostController.shared.changeIsFavorited(post: post)
        updateViews()
    }
    //    @IBAction func shareButtonTapped(_ sender: Any) {
    //    }
    @IBAction func otherButtonTapped(_ sender: UIButton) {
        //        guard let post = p
        let optionAlert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
            let confirmDelete = UIAlertController(title: "Delete", message: "Are you sure?", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "YES", style: .destructive, handler: { (_) in
                //            PostController.shared.delete(post: )
            })
            let cancelAction = UIAlertAction(title: "NO", style: .cancel, handler: nil)
            confirmDelete.addAction(confirmAction)
            confirmDelete.addAction(cancelAction)
            self.present(confirmDelete, animated: true, completion: nil)
        }
        
        let reportAction = UIAlertAction(title: "Report", style: .default) { (_) in
            let reportController = UIAlertController(title: "", message: "Are you sure you want to report this post?", preferredStyle: .alert)
            let confirmReport = UIAlertAction(title: "YES", style: .destructive, handler: { (_) in
                //Action for report: Send an email to the creators or firebase
            })
            let cancelReport = UIAlertAction(title: "NO", style: .cancel, handler: nil)
            reportController.addAction(confirmReport)
            reportController.addAction(cancelReport)
            self.present(reportController, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionAlert.addAction(deleteAction)
        optionAlert.addAction(reportAction)
        optionAlert.addAction(cancelAction)
        self.present(optionAlert, animated: true, completion: nil)
    }
}
