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
        let post = Post(image: image, text: text, category: category, username: username)
        posts?.append(post)
        // save
    }
    
    // func fetchPost(post: Post)
    
    // func fetchImageFor(post: Post)
    
    // func update(post: Post)
    func update(post: Post, with image: UIImage?, text: String, category: String, username: String) {
        post.image = image
        post.text = text
        post.category = category
        // save
    }
    
    // func delete(post: Post)
    func delete(post: Post) {
        guard let postIndex = posts?.firstIndex(of: post) else { return }
        posts?.remove(at: postIndex)
        // save
    }
    
    // MARK: - Local Persistence
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "tidbits.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        return fullURL
    }
    
    func saveToPersistentStore() {
        let encoder = JSONEncoder
    }
    
    // MARK: - Mock data
    
    
}
