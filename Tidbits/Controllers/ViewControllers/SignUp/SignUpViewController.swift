//
//  SignUpViewController.swift
//  Tidbits
//
//  Created by Xavier on 12/10/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpALreadyHaveAnAccountButton()
    }
    
    @objc func signInAction() {
        dismiss(animated: true, completion: nil)
    }
    
    let alreadyHaveAccountButton: UIButton = {
        let customizColor = UIColor(red: 20/255, green: 20/255, blue: 90/255, alpha: 1)
        let otherColor = UIColor.white
        let font = UIFont.systemFont(ofSize: 16)
        let font2 = UIFont.systemFont(ofSize: 12)
        let accountButton = UIButton(type: .system)
        //Using an attributed string because i'm want to use 2 diff colors for the account check button and sign in button. Don't want one color to get overwritten
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?", attributes: [NSAttributedString.Key.foregroundColor: customizColor])
        accountButton.setAttributedTitle(attributedTitle, for: .normal)
        attributedTitle.append(NSMutableAttributedString(string: "Sign In", attributes: [NSAttributedString.Key.foregroundColor : otherColor, NSMutableAttributedString.Key.font : font]))
        
        accountButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        return accountButton
    }()
    
    fileprivate func setUpALreadyHaveAnAccountButton(){
        alreadyHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(alreadyHaveAccountButton)
        NSLayoutConstraint.activate([
            alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            alreadyHaveAccountButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            alreadyHaveAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            alreadyHaveAccountButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
