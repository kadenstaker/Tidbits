//
//  InternalUserController.swift
//  Tidbits
//
//  Created by Kaden Staker on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import Foundation
import Firebase

class InternalUserController {
    
    // Singleton
    static let shared = InternalUserController()
    
    // Properties
    var loggedInUser: InternalUser?
    var posts: [Post]? = []
    var rtdb = Database.database()
    
    // Initializer
    private init () {}
    
    // MARK: - Functions
    func loginUser(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        FirebaseManager.logInUser(withEmail: email, password: password) { (userDictionary) in
            guard let userDictionary = userDictionary as? [String : Any] else { completion(false) ; return }
            let loggedInUser = InternalUser(dictionary: userDictionary)
            self.loggedInUser = loggedInUser
            completion(true)
        }
    }
    
    func createUserWith(email: String, password: String, username: String, completion: @escaping (Bool) -> Void) {
        FirebaseManager.createUser(withEmail: email, password: password, username: username) { (success) in
            if success {
                completion(true)
            } else {
                print("There was an error in \(#function)")
                completion(false)
            }
        }
    }
    
    func saveFavoritePost(postID: String, completion: @escaping(Bool) -> Void){
//        let favoritesRef = fa
        guard let loggedInUser = loggedInUser else { completion(false) ; return }
        loggedInUser.favoritePostIDs.append(postID)
        
        let favoritesRef = FirebaseManager.databaseRef.child("Users").child(loggedInUser.username).child("Favorite")
     
        print(favoritesRef.description())
        
        FirebaseManager.save(object: loggedInUser.favoritePostIDsDictionary,
                             to: favoritesRef) { (success) in
            completion(true)
        }
        
        
    }
    func getCurrentUser(completion: @escaping (Bool) -> Void) {
        FirebaseManager.getUser { (internalUserDictionary) in
            guard let internalUserDictionary = internalUserDictionary as? [String : Any], let internalUser = InternalUser(dictionary: internalUserDictionary) else { completion(false) ; return }
            self.loggedInUser = internalUser
            
        }
    }
    
    func uploadProfileImage(user: InternalUser, completion: @escaping ((_ sucess:Bool)->())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        var downloadURL: String?
        var image = UIImage()
        
        guard let imageData = image.jpegData(compressionQuality: 0.4) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        storageRef.putData(imageData, metadata: metaData) { (metaData, error) in
            if let error = error {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                completion(false); return
            }
            storageRef.downloadURL(completion: { (url, error) in
                downloadURL = url?.absoluteString
                //update local image
                user.profileImageURL = downloadURL
                
                
                let userObject = [
                    "username": user.username as Any,
                    "photoURL": user.profileImageURL as Any
                    ] as [String : Any]
                if let error = error {
                    print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
                    completion(false); return
                }
                completion(true)
            })
        }
        Storage.storage().reference(withPath: storageRef.fullPath).delete { (error) in
            if let error = error {
                print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
            }
        }
    }
    
    //    func saveProfile(username: String, profileImageURL: URL, completion: @escaping (( _ success:Bool)->())) {
    //        guard let uid = Auth.auth().currentUser?.uid else { return }
    //        let databaseRef = Database.database().reference().child("users/profile/\(uid)")
    //
    //        let userObject = [
    //            "username": username,
    //            "photoURL": profileImageURL.absoluteString
    //        ] as [String : Any]
    //
    //        databaseRef.setValue(userObject) { (error, ref) in
    //            completion(error == nil)
    //        }
    //    }
}


// func blockUser(user: InternalUser)

// func checkIfLoggedIn()

