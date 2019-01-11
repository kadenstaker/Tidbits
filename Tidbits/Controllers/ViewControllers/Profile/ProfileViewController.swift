//
//  ProfileViewController.swift
//  Tidbits
//
//  Created by Xavier on 12/3/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit
import  Firebase

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var setProfilePicButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var ImageViewOutlet: UIImageView!
    @IBOutlet weak var customizedSignOutButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizedSignOutButton.setTitleColor(.black, for: .normal)
        customizedSignOutButton.layer.cornerRadius = 8
        disable()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateViews()
    }
    func updateViews() {
        guard let internalUser = InternalUserController.shared.loggedInUser else { return }
        welcomeLabel.text = "Welcome, \(internalUser.username)!"
        guard internalUser.profileImage != nil else { return }
        if internalUser.profileImage == nil {
            ImageViewOutlet.image = #imageLiteral(resourceName: "defaultImage")
        }else {
            ImageViewOutlet.image = internalUser.profileImage
        }
    }
    
    
    @IBAction func setProfilePicButtonTapped(_ sender: Any) {
        
        //        setProfilePicButton.isHidden = false
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let actionSheet = UIAlertController(title: "Select a Photo", message: nil, preferredStyle: .actionSheet)
        let _ = UIImagePickerController.isSourceTypeAvailable(.camera)
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { (_) in
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePicker, animated: true, completion: nil)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet, animated:  true)
        
    }
    
    func enableEditing() {
        editButton.setTitle("Save", for: .normal)
        print("save button tapped")
        setProfilePicButton.isEnabled = true
        setProfilePicButton.isHidden = false
        //        setProfilePicButton.isHidden = true
        cancelButton.isHidden = false
    }
    
    func disable() {
        editButton.setTitle("Edit", for: .normal)
        setProfilePicButton.isEnabled = false
        setProfilePicButton.isHidden = true
    }
    
    func alertAppear() {
        let alert = UIAlertController(title: nil , message: "Are your sure you want to sign out?", preferredStyle: .actionSheet)
        
        let signOut = UIAlertAction(title: "Sign Out", style: .destructive) { (_) in
            InternalUserController.shared.loggedInUser
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(signOut)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - Actions
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        alertAppear()
        do {
            try Auth.auth().signOut()
            InternalUserController.shared.loggedInUser = nil
            self.tabBarController?.selectedIndex = 0
        }catch{
            print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
        }
    }
    
    
    
    
    @objc func cancelAction(){
        let storyboard = UIStoryboard(name: "collectionVC", bundle: nil)
        let collectVC = storyboard.instantiateInitialViewController()!
        present(collectVC, animated: true, completion: nil)
        print("Cancel Button tapped")
    }
    
    
    //Edit button Tapped Here
    @IBAction func editButtonTapped(_ sender: Any) {
        if editButton.titleLabel?.text == "Edit"{
            enableEditing()
        }else{
            guard let user = InternalUserController.shared.loggedInUser else { return }
            if ImageViewOutlet.image == UIImage(named: "defaultImage") {
                user.profileImage = nil
            }else {
                user.profileImage = ImageViewOutlet.image
            }
            InternalUserController.shared.uploadProfileImage(user: user) { (success) in
                if success{
                    DispatchQueue.main.async {
                        self.disable()
                        self.cancelButton.isHidden = true
                    }
                }
            }
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        updateViews()
        disable()
        cancelButton.isHidden = true
    }
}

//
extension ProfileViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        setProfilePicButton.setTitle("", for: .normal)
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[.editedImage] as? UIImage {
            
            ImageViewOutlet.image = photo
            //            setProfilePicButton.setBackgroundImage(photo, for: .normal)
            //            setProfilePicButton.setImage(nil, for: .normal)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
