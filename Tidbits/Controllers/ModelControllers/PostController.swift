//
//  PostController.swift
//  Tidbits
//
//  Created by Kaden Staker on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit
import Firebase

class PostController {
    
    // Singleton
    static let shared = PostController()
    
    // Properties
    var posts: [Post]?
    
    // Initializer
    private init() {}
    
    // func createPostWith(image: UIImage?, text: String)
    func createPostWith(image: UIImage, text: String, category: String, username: String) {
    }
    
    // func fetchPost(post: Post)
    
    // func fetchImageFor(post: Post)
    
    // func update(post: Post)
    func update(post: Post, with image: UIImage?, text: String, category: String) {
    }
    
    // func delete(post: Post)
    func delete(post: Post) {
    }
    
    // MARK: - Mock data
    
    
}
