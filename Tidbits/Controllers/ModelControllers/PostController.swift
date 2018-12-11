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
    
    let categories = ["All", "Food", "Party", "Money", "Tech", "Health", "Favorite", "Favorite", "Funny"]
    
    // Initializer
    private init() {}
    
    // Functions
    func createPostWith(image: UIImage?, text: String, category: String, username: String, completion: @escaping (Bool) -> Void) {
        
        let post = Post(image: image, text: text, category: category, createdByID: username)
        
        let databaseRef = FirebaseManager.databaseRef.child("Post").childByAutoId()
        
        if let image = image {
            guard let imageAsData = image.pngData() else { completion(false) ; return }
            let storeRef = FirebaseManager.storeRef.child("Post").child(databaseRef.key!)
            FirebaseManager.save(data: imageAsData, to: storeRef) { (metadata, error, urlAsString) in
                if let _ = error {
                    completion(false)
                    return
                }
                
                guard let imageURLAsString = urlAsString else { completion(false) ; return }
                post.imageURL = imageURLAsString
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
    }
    
    func fetchImageFor(post: Post, completion: @escaping (UIImage?) -> Void) {
        guard let imageURL = post.imageURL,
            let url = URL(string: imageURL)
            else { completion(nil) ; return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("There was an error retrieving the post's image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil) ; return }
            let postImage = UIImage(data: data)
            completion(postImage)
        }
        dataTask.resume()
    
    // func update(post: Post)
    func update(post: Post, with image: UIImage?, text: String, category: String) {
    }
    
    // func delete(post: Post)
    func delete(post: Post) {
    }
}
}
