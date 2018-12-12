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
        logIn.backgroundColor = otherTheme
        logIn.layer.cornerRadius = 10
        return logIn
    }()
    
    let forgotPButton: UIButton = {
        let forgotButton = UIButton(type: .system)
        forgotButton.setTitleColor(.white, for: .normal)
        forgotButton.setTitle("Forgot Password?", for: .normal)
        forgotButton.backgroundColor = otherTheme
        return forgotButton
    }()
    
    @objc func signupAction(){
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        
        let signUpVc = storyboard.instantiateInitialViewController()!
        present(signUpVc, animated: true, completion: nil)
    print("Sign up button Tapped, So let's sign up")
    }
    
    
    
    
    let accountCheckButton: UIButton = {
        let customizColor = UIColor(red: 20/255, green: 20/255, blue: 90/255, alpha: 1)
        let otherColor = UIColor.white
        let font = UIFont.systemFont(ofSize: 16)
        let font2 = UIFont.systemFont(ofSize: 12)
        let accountButton = UIButton(type: .system)
        //Using an attributed string because i'm want to use 2 diff colors for the account check button and sign in button. Don't want one color to get overwritten
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?", attributes: [NSAttributedString.Key.foregroundColor: customizColor])
        accountButton.setAttributedTitle(attributedTitle, for: .normal)
        attributedTitle.append(NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.foregroundColor : otherColor, NSMutableAttributedString.Key.font : font]))
        
        accountButton.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        
        return accountButton
    }()
    
    var emailTextField: UITextField = {
        let email = UITextField()
//        email.layer.borderColor = UIColor.white.cgColor
//        email.layer.borderWidth = 2
        email.boarderForBottom(backGroundColor: otherTheme, borderColor: .white)
//        email.borderStyle = UITextField.BorderStyle.line
        let attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        email.attributedPlaceholder = attributedPlaceholder
        email.textColor = .white
//        email.backgroundColor = goldTheme
        return email
    }()
    
    var passwordTextField: UITextField = {
        let password = UITextField()
//        password.placeholder = "Password"
        password.isSecureTextEntry = true
        password.boarderForBottom(backGroundColor: otherTheme, borderColor: .white)
//        password.borderStyle = UITextField.BorderStyle.roundedRect
        let attributedTextPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        password.attributedPlaceholder = attributedTextPlaceholder
        password.textColor = .white
//        password.backgroundColor = goldTheme
        return password
    }()
    
    fileprivate func forgotPasswordButton() {
        forgotPButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(forgotPButton)
        
        NSLayoutConstraint.activate([
            forgotPButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 8),
            forgotPButton.leftAnchor.constraint(equalTo: logInButton.leftAnchor, constant: 0),
            forgotPButton.rightAnchor.constraint(equalTo: logInButton.rightAnchor, constant: 0),
            forgotPButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    //Just changes the status bar to a light color.Everything at the top of the screen, the battery the provider etc
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    fileprivate func updateTextFields() {
        setupEmailTextField()
        setupPasswordTextField()
        setupLogInButton()
        setupAccountCheckButton()
        forgotPasswordButton()
    }
    
    fileprivate func setupEmailTextField() {
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
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
            passwordTextField.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
    }
    fileprivate func setupLogInButton() {
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12),
            logInButton.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: 0),
            logInButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 0),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            ])
    }
    
    fileprivate func setupAccountCheckButton() {
        accountCheckButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(accountCheckButton)
        NSLayoutConstraint.activate([
            accountCheckButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            accountCheckButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            accountCheckButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            accountCheckButton.heightAnchor.constraint(equalToConstant: 30)
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
