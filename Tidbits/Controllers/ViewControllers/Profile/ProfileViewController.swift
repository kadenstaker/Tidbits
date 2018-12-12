//
//  ProfileViewController.swift
//  Tidbits
//
//  Created by Xavier on 12/3/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //MARK: - Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var aboutMeTextView: UITextView!
    @IBOutlet weak var setProfilePicButton: UIButton!
    @IBOutlet weak var defaultImage: UIImageView!
    @IBOutlet weak var customizedSignOutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizedSignOutButton.setTitleColor(.black, for: .normal)
        customizedSignOutButton.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        defaultImage.image = nil
        
        if InternalUserController.shared.loggedInUser == nil{
            
            let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
            let signInVC = storyboard.instantiateViewController(withIdentifier: "backToSignIn") as! SignInViewController
            
            present(signInVC, animated: true, completion: nil)
        }
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

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

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
