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
    var profileImage: Data?
    var favoritePostIDs: String?
    var postIDs: [Post]?
    let email: String
    var blockedIDs: [String]?
    
    // Initializer
    init(username: String, profileImage: Data?, favoritePostIDs: String?, postIDs: [Post]?, email: String) {
        self.username = username
        self.profileImage = profileImage
        self.favoritePostIDs = favoritePostIDs
        self.postIDs = postIDs
        self.email = email
    }
    
    init?(dictionary: [String : Any]) {
        guard let email = dictionary["email"] as? String,
        let username = dictionary["username"] as? String
            else { return nil }
        
        self.email = email
        self.username = username
    }
}
