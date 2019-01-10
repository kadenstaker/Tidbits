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
    static var handle: AuthStateDidChangeListenerHandle?
    
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
    
    static public func logInUser(withEmail email: String, password: String, completion: @escaping (Any?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("There was an error in \(#function): \(error), \(error.localizedDescription)")
                completion(false)
                return
            } else {
                // fetch the user
                let ref = FirebaseManager.databaseRef.child("Users").child(user!.user.displayName!)
                FirebaseManager.fetch(from: ref, completion: { (userDictionary) in
                    completion(userDictionary)
                })
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
            
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = username
            changeRequest?.commitChanges(completion: { (error) in
                if let error = error {
                    print(error)
                    completion(false)
                    return
                }
                let ref = databaseRef.child("Users").child(username)
                
                let userDictionary: [String : Any] = ["email" : email,
                                                      "username" : username]
                
                ref.setValue(userDictionary, andPriority: nil, withCompletionBlock: { (error, _) in
                    if let error = error {
                        print(error)
                        completion(false)
                        return
                    }
                    completion(true)
                })
            })
        }
    }
    
    static func getUser(completion: @escaping (Any?) -> Void) {
        if let firebaseUser = Auth.auth().currentUser, let username = firebaseUser.displayName {
            let ref = FirebaseManager.databaseRef.child("Users").child(username)
            FirebaseManager.fetch(from: ref) { (internalUser) in
                completion(internalUser)
            }
        } else {
            completion(nil)
        }
    }
    
    static public func fetch(from ref: DatabaseReference, completion: @escaping (Any?) -> Void) {
        ref.observeSingleEvent(of: .value) { (snapshot) in
            completion(snapshot.value)
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
                print("There was an error saving to the database. \(error) \(error.localizedDescription)")
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    // MARK: - Firebase Storage
    
    static public func save(data: Data, to ref: StorageReference, completion: @escaping (StorageMetadata?, Error?, String?) -> Void) {
        ref.putData(data, metadata: nil) { (metadata, error) in
            if let error = error {
                print("There was an error saving data to the storage.: \(error.localizedDescription)")
                completion(nil, error, nil)
                return
            }
            guard let metadata = metadata else { completion(nil, error, nil) ; return }
            ref.downloadURL(completion: { (url, error) in
                if let error = error {
                    print("There was an error downloading the storage reference URL: \(error.localizedDescription)")
                    completion(metadata, error, nil)
                }
                guard let url = url else { completion(metadata, error, nil) ; return }
                let imageURLAsString = url.absoluteString
                completion(metadata, nil, imageURLAsString)
            })
        }
    }
}

