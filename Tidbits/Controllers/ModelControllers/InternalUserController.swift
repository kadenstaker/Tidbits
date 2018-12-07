//
//  InternalUserController.swift
//  Tidbits
//
//  Created by Kaden Staker on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import Foundation

class InternalUserController {
    
    // Singleton
    static let shared = InternalUserController()
    
    // Properties
    var users: [InternalUser]?
    var posts: [Post] = []
    
    // Initializer
    private init () {}
    
    // MARK: - Functions
    func loginUser(withEmail email: String, password: String, completion: @escaping (Bool) -> Void) {
        FirebaseManager.logInUser(withEmail: email, password: password) { (success) in
            if success {
                completion(true)
            } else {
                print("There was an error in \(#function)")
                completion(false)
            }
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
    
    // func blockUser(user: InternalUser)
    
    // func checkIfLoggedIn()
}
