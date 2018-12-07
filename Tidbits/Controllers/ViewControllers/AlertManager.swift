//
//  AlertManager.swift
//  Tidbits
//
//  Created by Xavier on 11/30/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class AlertManager {
    
    static func presentAlerts() -> UIAlertController{
        let alert = UIAlertController(title: "Delete Tidbit", message: "Are you sure you want to delete this Tidbit?", preferredStyle: .alert)
        let userAction = UIAlertAction(title: "YES", style: .destructive, handler: nil)
        let noButton = UIAlertAction(title: "NO", style: .cancel, handler: nil)
        alert.addAction(userAction)
        alert.addAction(noButton)
        return alert
        
    }
    
    static func deleteAccountAlert() ->UIAlertController {
        let deleteAlert = UIAlertController(title: "Delete Account", message: "Are you sure you want to delete your account? You can't undo this.", preferredStyle: .alert)
        let userAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        deleteAlert.addAction(userAction)
        return deleteAlert
    }
    
//    static func reportAlert() -> UIAlertController{
////        let reportAlert = UIAlertController(title: "Report Post", message: "Are you sure you want to report this Post?", preferredStyle: <#T##UIAlertController.Style#>)
//    }
   
}

//What kind of alerts
//Delete Post: Are you sure you want to delete this post?
//Delete account: Are you sure you want to delete your account
//No internet detection
//If they try to post without a Account: Alert" You can't post without an Account"
//

