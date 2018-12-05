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

class FirebaseManager {
    
    static var reference: DatabaseReference = Database.database().reference()
    
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
            let ref = reference.child("Users").child(username)
            
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
        
    }
    
    static public func deleteUser(user: InternalUser, completion: @escaping (Bool) -> Void) {
        
    }
}
