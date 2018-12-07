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
    
    enum Categories: String {
        case all = "All"
        
        case food = "Food"
        case party = "Party"
        case money = "Money"
        case tech = "Tech"
        case health = "Health"
        case favorite = "Favorite"
        case funny = "Funny"
    }
    
    // Initializer
    private init() {}
    
    // func createPostWith(image: UIImage?, text: String)
    func createPostWith(image: UIImage?, text: String, category: String, username: String, completion: @escaping (Bool) -> Void) {
        
        let post = Post(image: image, text: text, category: category, createdByID: username)
        
        let databaseRef = Database.database().reference().childByAutoId()

        if let image = image {
            guard let imageAsData = image.pngData() else { completion(false) ; return }
            let storeRef = Storage.storage().reference().child("Post").child(databaseRef.key!)
            FirebaseManager.save(data: imageAsData, to: storeRef) { (metadata, error) in
                if let _ = error {
                    completion(false)
                    return
                }
                
                metadata.downloadURL
        
                
                FirebaseManager.save(object: post.asDictionary, to: databaseRef, completion: { (success) in
                    if success {
                        completion(true)
                    }
                })
            }
        } else {
            FirebaseManager.save(object: post.asDictionary, to: databaseRef, completion: { (success) in
                if success {
                    completion(true)
                }
            })

        }
    }
    
    // func fetchPost(post: Post)
    
    // func fetchImageFor(post: Post)
    
    // func update(post: Post)
    func update(post: Post, with image: UIImage?, text: String, category: String) {
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
        let encoder = JSONEncoder()
    }
    
    // MARK: - Mock data
    
    
}
