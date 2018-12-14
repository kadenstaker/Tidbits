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
    
    var internalUser: InternalUser?{
        didSet{
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizedSignOutButton.setTitleColor(.black, for: .normal)
        customizedSignOutButton.layer.cornerRadius = 8
    }
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            InternalUserController.shared.loggedInUser = nil
            self.tabBarController?.selectedIndex = 0
        }catch{
            print("There was an error in \(#function) ; \(error) ; \(error.localizedDescription) ")
        }
    }
    
    func updateViews() {
        guard let internalUser = internalUser else { return }
        welcomeLabel.text = "Welcome to Tidbits \(internalUser.username)"
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
