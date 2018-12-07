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
    var uid: String?
    let createdByID: String
    
    var asDictionary: [String : Any] {
        var dictionary = [
            "text" : text,
            "category" : category,
            "createdByID" : createdByID
        ]
        
        if let imageURL = imageURL {
            dictionary["imageURL"] = imageURL
        }
        
        return dictionary
    }
    
    // Initializer
    init(image: UIImage?, text: String, category: String, createdByID: String) {
        self.image = image
        self.text = text
        self.category = category
        self.createdByID = createdByID
    }
    
    init?(postDictionary: [String : Any]) {
        guard let text = postDictionary["text"] as? String,
            let category = postDictionary["category"] as? String
            else { return nil }
        
        self.text = text
        self.category = category
        self.createdByID = "sdas"
    }
}

extension Post: Equatable {
    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.image == rhs.image &&
            lhs.text == rhs.text &&
            lhs.category == rhs.category &&
            lhs.createdByID == rhs.createdByID
    }
}
