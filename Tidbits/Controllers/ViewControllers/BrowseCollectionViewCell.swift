//
//  BrowseCollectionViewCell.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class BrowseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var numberOfItemLabel: UILabel!
    
    var post: Post? {
        didSet{
            
        }
    }
    
    func updateViews(){
        guard let post = post else { return }
        categoryNameLabel.text = post.category
//        iconImageView.image = UIImage(named: post.)
    }
    
}
