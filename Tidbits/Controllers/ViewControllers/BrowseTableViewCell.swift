//
//  BrowseTableViewCell.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class BrowseTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var tidbitImageView: UIImageView!
    @IBOutlet weak var tidbitTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    var isChosen: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var post: Post? {
        didSet{
            updateViews()
        }
    }
    
    //Probs have to create an array to append the post the user favorite and hearted
    
    //MARK: - Actions
    @IBAction func starButtonTapped(_ sender: UIButton) {
        if isChosen == true {
            starButton.setImage(#imageLiteral(resourceName: "iconfinder_star_285661"), for: .normal)
        } else {
            starButton.setImage(#imageLiteral(resourceName: "defaultStar"), for: .normal)
        }
    }
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        if isChosen {
            heartButton.setImage(#imageLiteral(resourceName: "iconfinder_Instagram_UI-07_2315589"), for: .normal)
        }else {
            heartButton.setImage(#imageLiteral(resourceName: "defaultHeart"), for: .normal)
        }
    }
    
    func updateViews() {
        guard let post = post else { return }
    }
    
    // I just hid the share button I didn't delete it.
//    @IBAction func shareButtonTapped(_ sender: UIButton) {
////        let activityController = UIActivityViewController(activityItems: <#T##[Any]#>, applicationActivities: <#T##[UIActivity]?#>)
//    }
    
    
}
