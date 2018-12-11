//
//  BrowseCollectionViewCell.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

//call delegate in the child

import UIKit

class BrowseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var numberOfItemLabel: UILabel!
    
    var category: String? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews(){
        guard let category = category else { return }
        categoryNameLabel.text = category
        iconImageView.image = UIImage(named: category)
    }
    
}
