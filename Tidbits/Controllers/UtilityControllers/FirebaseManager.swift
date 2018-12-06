//
//  FirebaseManager.swift
//  Tidbits
//
//  Created by Kaden Staker on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage

class FirebaseManager {
    
    // MARK: - Properties
    static var databaseRef: DatabaseReference = Database.database().reference()
    static var storeRef: StorageReference = Storage.storage().reference()
    
    // MARK: - User Management
    static public func signInAnonymously(completion: @escaping (Bool) -> Void) {
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                print("There was an error in \(#function): \(error), \(error.localizedDescription)")
                completion(false)
                return
            } else {
//                let user = authResult?.user
//                let isAnonymous = user?.isAnonymous // true
//                let uid = user?.uid
                completion(true)
            }
        }
    }
    
    static public func logInUser(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("There was an error in \(#function): \(error), \(error.localizedDescription)")
                completion(false)
                return
            } else {
                // fetch the user
                completion(true)
            }
        }
    }
    
    static public func createUser(withEmail email: String, password: String, username: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("There was an error in \(#function): \(error), \(error.localizedDescription)")
                completion(false)
                return
            }
            let ref = databaseRef.child("Users").child(username)
            
            let userDictionary: [String : Any] = ["email" : email,
                                                  "password" : password,
                                                  "username" : username]
            
            ref.setValue(userDictionary, andPriority: nil, withCompletionBlock: { (error, _) in
                if let error = error {
                    print(error)
                    completion(false)
                    return
                }
                completion(true)
            })
        }
    }
    
    static public func blockUser(user: InternalUser, reason: String, completion: @escaping (Bool) -> Void) {
        // Not for MVP
    }
    
    static public func deleteUser(user: InternalUser, completion: @escaping (Bool) -> Void) {
        // Not for MVP
    }
    
    
    // MARK: - Post Management
    static public func save(object: Any, to ref: DatabaseReference, completion: @escaping (Bool) -> Void) {
        
        ref.setValue(object) { (error, _) in
            if let error = error {
                print("There was an error saving to the database.")
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    // MARK: - Firebase Storage
    
    static public func save(data: Data, to ref: StorageReference, completion: @escaping (StorageMetadata?, Error?) -> Void) {

        ref.putData(data, metadata: nil) { (metadata, error) in
            if let error = error {
                print("There was an error saving data to the storage.")
                completion(nil, error)
                return
            }
            guard let metadata = metadata else { completion(nil, error) ; return }
            completion(metadata, nil)
        }
        
    }
}

