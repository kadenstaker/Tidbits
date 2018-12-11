//
//  BrowseTableViewCell.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

//Declare Protocol
protocol BrowseTableViewCellDelegate: class {
    func isFavoritedImageValueChanged(cell: BrowseTableViewCell)
}

class BrowseTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var tidbitImageView: UIImageView!
    @IBOutlet weak var tidbitTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
//    @IBOutlet weak var shareButton: UIButton!
    
    //declaring the delegates variable
    weak var delegate: BrowseTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    //Probs have to create an array to append the post the user favorite and hearted
    
    //MARK: - Actions
    
    @IBAction func heartButtonTapped(_ sender: UIButton) {
        //Call the delegate function
        delegate?.isFavoritedImageValueChanged(cell: self)
    }
    
    func updateViews() {
        guard let post = post else { return }
        tidbitTextLabel.text = post.text
//        tidbitImageView.image = post.image
//        dateLabel.text = post.timestamp.formatLong()
    }
    
    // I just hid the share button I didn't delete it.
//    @IBAction func shareButtonTapped(_ sender: UIButton) {
////        let activityController = UIActivityViewController(activityItems: <#T##[Any]#>, applicationActivities: <#T##[UIActivity]?#>)
//    }
}
