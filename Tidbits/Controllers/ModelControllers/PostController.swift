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
    var posts: [Post]? = []
    var techPosts: [Post]? = []
    var foodPosts: [Post]? = []
    var moneyPosts: [Post]? = []
    var healthPosts: [Post]? = []
    var funnyPosts: [Post]? = []
    var partyPosts: [Post]? = []
    var favoritePosts: [Post]? = []
    
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
                
                metadata?.storageReference?.downloadURL(completion: { (url, error) in
                    guard let url = url?.absoluteString else { completion(false) ; return }
                    
                    post.imageURL = url
                    
                    FirebaseManager.save(object: post.asDictionary, to: databaseRef, completion: { (success) in
                        if success {
                            completion(true)
                        }
                    })
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
    
    
    func fetchPosts(completion: @escaping (Bool) -> Void) {
        let ref = FirebaseManager.databaseRef.child("Post")
        
        FirebaseManager.fetch(from: ref) { (fetchedPosts) in
            guard let postDictionaries = fetchedPosts as? [String : [String : Any]] else { completion(false) ; return }
            self.posts = postDictionaries.compactMap { Post(postDictionary: $0.value) }
            
            self.techPosts = self.posts?.filter{ $0.category == "Tech" }
            self.foodPosts = self.posts?.filter{ $0.category == "Food" }
            self.techPosts = self.posts?.filter{ $0.category == "Tech" }
            self.moneyPosts = self.posts?.filter{ $0.category == "Money" }
            self.healthPosts = self.posts?.filter{ $0.category == "Health" }
            self.funnyPosts = self.posts?.filter{ $0.category == "Funny" }
            self.partyPosts = self.posts?.filter{ $0.category == "Party" }
            self.favoritePosts = self.posts?.filter{ $0.category == "Favorites" }
        }
        
        // func fetchImageFor(post: Post)
        
        // func update(post: Post)
        func update(post: Post, with image: UIImage?, text: String, category: String) {
        }
        
        // func delete(post: Post)
        func delete(post: Post) {
        }
    }
}
