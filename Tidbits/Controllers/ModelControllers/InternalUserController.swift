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
    var posts: [Post]?
    
    // Initializer
    private init () {}
    
    // MARK: - Functions
    // func logInUser
    
    // func createUserWith(username: String, password: String)
    
    // func blockUser(user: InternalUser)
    
    // func checkIfLoggedIn()
}
