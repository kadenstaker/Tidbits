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
    @IBOutlet weak var defaultImage: UIImageView!
    @IBOutlet weak var customizedSignOutButton: UIButton!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return.lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizedSignOutButton.setTitleColor(.black, for: .normal)
        customizedSignOutButton.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateViews()
    }
    func updateViews() {
        guard let internalUser = InternalUserController.shared.loggedInUser else { return }
        welcomeLabel.text = "Welcome, \(internalUser.username)!"
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
    
    @IBAction func addProfileImageButtonTapped(_ sender: UIButton) {
        
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
}

extension ProfileViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        setProfilePicButton.setTitle("", for: .normal)
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            defaultImage.image = photo
            //            setProfilePicButton.setBackgroundImage(photo, for: .normal)
            setProfilePicButton.setImage(nil, for: .normal)
            
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
