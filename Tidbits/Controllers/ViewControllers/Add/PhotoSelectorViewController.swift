//
//  PhotoSelectorViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/30/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

protocol PhotoSelectorViewControllerDelegate: class {
    func selectPhoto(_ photo: UIImage)
}

class PhotoSelectorViewController: UIViewController {
    
    
    @IBOutlet weak var defaultImage: UIImageView!
    @IBOutlet weak var selectPhotoButton: UIButton!
    
    weak var delegate: PhotoSelectorViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectPhotoButton.setTitle("Select Photo", for: .normal)
//        selectPhotoButton.setTitleColor(.black, for: .normal)
//        selectPhotoButton.setImage(#imageLiteral(resourceName: "photoPlaceholder"), for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultImage.image = nil
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
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




extension PhotoSelectorViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectPhotoButton.setTitle("", for: .normal)
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            selectPhotoButton.setImage(photo, for: .normal)
            delegate?.selectPhoto(photo)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
