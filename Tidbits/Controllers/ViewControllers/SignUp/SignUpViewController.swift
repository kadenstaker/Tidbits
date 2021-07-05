//
//  SignUpViewController.swift
//  Tidbits
//
//  Created by Xavier on 12/10/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpALreadyHaveAnAccountButton()
        customizations()
        
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        self.navigationController?.transparentNavBar()
    }
    
    //MARK: - Actions
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        signUserUp()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        let _ = dismiss(animated: true, completion: nil)
        
    }
    
    func editTextFields(_ textFields: UITextField){
        textFields.layer.cornerRadius = 20
        textFields.layer.backgroundColor = otherTheme.cgColor
        textFields.borderStyle = .roundedRect
    }
    
        func customizations() {
            editTextFields(emailTextField)
            editTextFields(usernameTextField)
            editTextFields(passwordTextField)
            
//            signUpButton.layer.cornerRadius = 20
//            signUpButton.layer.backgroundColor = otherTheme.cgColor
            signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
//            signUpButton.layer.shadowColor = otherTheme.cgColor
//            signUpButton.layer.shadowRadius = 4
//            signUpButton.layer.shadowOpacity = 1
//            signUpButton.layer.shadowOffset = CGSize(width: 0, height: 0)
            signUpButton.layer.borderWidth = 1.0
            signUpButton.setTitleColor(UIColor.white, for: .normal)
            signUpButton.layer.borderColor = otherTheme.cgColor
            signUpButton.layer.backgroundColor = otherTheme.cgColor
        }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
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
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.foregroundColor: customizColor])
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
    
    func signUserUp(){
        guard let newUsername = usernameTextField.text, !newUsername.isEmpty,
            let userEmail = emailTextField.text, !userEmail.isEmpty, let userPassword = passwordTextField.text, !userPassword.isEmpty else {
                AlertManager.signInAlert(self, title: "Missing Info", message: "Please fill out all fields")
                return
        }
        
        InternalUserController.shared.createUserWith(email: userEmail, password: userPassword, username: newUsername) { (success) in
            if success {
                DispatchQueue.main.async {
                    self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
                    print("User created Successfully")
                    print(userEmail)
                }
            }
        }
    }
}

extension SignUpViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == emailTextField{
//            emailTextField.becomeFirstResponder()
//        }
        
        if textField == emailTextField{
            emailTextField.resignFirstResponder()
        }
//        if textField == usernameTextField{
//            usernameTextField.becomeFirstResponder()
//        }
        if textField == usernameTextField{
            usernameTextField.resignFirstResponder()
        }
//        if textField == passwordTextField{
//            passwordTextField.becomeFirstResponder()
//        }
        if textField == passwordTextField{
            passwordTextField.isSecureTextEntry = true
            passwordTextField.resignFirstResponder()
            signUserUp()
        }
        return true
    }
}
