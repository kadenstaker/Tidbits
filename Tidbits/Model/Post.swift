//
//  Post.swift
//  Tidbits
//
//  Created by Kaden Staker on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class Post {
    
    // Properties
    let image: UIImage? // Image url
    // var imageURL: String?
    var text: String
    let category: String
    let username: String
    // var uid: String?
    
    // Initializer
    init(image: UIImage?, text: String, category: String, username: String) {
        self.image = image
        self.text = text
        self.category = category
        self.username = username
    }
}
