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
    var image: UIImage?
    var imageURL: String?
    var text: String
    var category: String
    let username: String
    var uid: String?
    
    // Initializer
    init(image: UIImage?, text: String, category: String, username: String) {
        self.image = image
        self.text = text
        self.category = category
        self.username = username
    }
}

extension Post: Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.image == rhs.image &&
            lhs.text == rhs.text &&
            lhs.category == rhs.category &&
            lhs.username == rhs.username
    }
}
