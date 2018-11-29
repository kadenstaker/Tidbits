//
//  InternalUser.swift
//  Tidbits
//
//  Created by Kaden Staker on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class InternalUser {
    
    // Properties
    let username: String
    var profileImage: UIImage?
    var favorites: String?
    var posts: [Post]?
    // let email: String
    
    // Initializer
    init(username: String, profileImage: UIImage?, favorites: String?, posts: [Post]?) {
        self.username = username
        self.profileImage = profileImage
        self.favorites = favorites
        self.posts = posts
    }
}
