//
//  SignInViewController.swift
//  Tidbits
//
//  Created by Xavier on 12/10/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextFields()
    }
    
    let myStoryboard = UIStoryboard(name: "SignUp", bundle: nil)
    
    let logInButton: UIButton = {
        let logIn = UIButton(type: .system)
        logIn.setTitleColor(.white, for: .normal)
        logIn.setTitle("Log In", for: .normal)
        logIn.backgroundColor = UIColor.cyan
        return logIn
    }()
    
    var emailTextField:UITextField {
        let email = UITextField()
        email.placeholder = "Email"
        email.textColor = .white
        email.backgroundColor = .red
        return email
    }
    
    var passwordTextField: UITextField {
        let password = UITextField()
        password.placeholder = "Password"
        password.textColor = .white
        password.backgroundColor = .blue
        return password
    }
    
    fileprivate func updateTextFields() {
        setupEmailTextField()
        setupPasswordTextField()
    }
    
    fileprivate func setupEmailTextField() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            emailTextField.leftAnchor.constraint(lessThanOrEqualTo: view.leftAnchor, constant: 24),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 30)
            ])
        
    }
    
    fileprivate func setupPasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            passwordTextField.leftAnchor.constraint(equalTo: emailTextField.leftAnchor, constant: 0),
            passwordTextField.rightAnchor.constraint(equalTo: emailTextField.rightAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 30)
            ])
        
    }
    fileprivate func setupLogInButton() {
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8),
            logInButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 0),
            logInButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 0),
            logInButton.heightAnchor.constraint(equalToConstant: 30),
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
