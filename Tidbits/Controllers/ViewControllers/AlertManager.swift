//
//  AlertManager.swift
//  Tidbits
//
//  Created by Xavier on 11/30/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class AlertManager {
    
    static func presentAlerts(){
        let alert = UIAlertController(title: "Delete Tidbit", message: "Are you sure you want to delete this Tidbit", preferredStyle: .alert)
        let userAction = UIAlertAction(title: "YES", style: .default, handler: nil)
        alert.addAction(userAction)
    }
    
    static func deleteAccountAlert() {
        let deleteAlert = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account? You can't undo this.", preferredStyle: .alert)
        let userAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        deleteAlert.addAction(userAction)
    }
   
}

//What kind of alerts
//Delete Post: Are you sure you want to delete this post?
//Delete account: Are you sure you want to delete your account
//No internet detection
//If they try to post without a Account: Alert" You can't post without an Account"
//

