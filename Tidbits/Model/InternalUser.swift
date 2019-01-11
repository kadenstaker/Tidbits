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
    var profileImageURL: String?
    var profileImage: UIImage?
    var favoritePostIDs: [String] = []
    var postIDs: [Post] = []
    let email: String
    var blockedIDs: [String] = []
    var favoritePostIDsDictionary: [String : Bool] {
        guard let loggedInUser = InternalUserController.shared.loggedInUser else { return [:] }
        var dictionary: [String : Bool] = [:]
        loggedInUser.favoritePostIDs.forEach {
            dictionary[$0] = true
        }
        return dictionary
    }
    
    // Initializer
    init(username: String, profileImageURL: String?, profileImage: UIImage?, postIDs: [Post] = [], email: String) {
        self.username = username
        self.profileImageURL = profileImageURL
        self.profileImage = profileImage
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
