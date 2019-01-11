//
//  AddHackViewController.swift
//  Tidbits
//
//  Created by Kaden Staker on 12/14/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class AddHackViewController: UITableViewController {
    
    //MARK: Outlets
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var enterTidbitTextField: UITextField!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var postImageView: UIView!
    
    //    var hackText: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTextField.inputView = categoryPickerView
        pickerData = ["All", "Tech", "Food", "Money", "Health", "Funny", "Party", "Favorites"]
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        setupTextField()
        imageViewStuff()
    }
    
    func imageViewStuff() {
        guard let postImageView = postImageView else { return }
        postImageView.clipsToBounds = true
        postImageView.contentMode = .scaleAspectFit
    }
    
    let viewController:UIViewController = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as UIViewController
    var photo: UIImage?
    var category: PostController.Categories?
    var pickerData: [String] = []
    
    @IBAction func postButtonTapped(_ sender: Any) {
        print("post button was tapped")
        guard let image = photo,
            let tidbit = enterTidbitTextField.text,
            !tidbit.isEmpty,
            let category = categoryTextField.text else { return }
        PostController.shared.createPostWith(image: image, text: tidbit, category: category, username: "") { (post) in
            self.enterTidbitTextField.text = ""
            self.categoryTextField.text = ""
            //Need to clear the image as well
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        enterTidbitTextField.text = ""
        categoryTextField.text = ""
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        enterTidbitTextField.resignFirstResponder()
        categoryTextField.resignFirstResponder()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageSelector"{
            guard let destinationVC = segue.destination as? PhotoSelectorViewController else { return}
            destinationVC.delegate = self
        }
    }
}

extension AddHackViewController: PhotoSelectorViewControllerDelegate {
    
    func selectPhoto(_ photo: UIImage) {
        self.photo = photo
    }
}

extension AddHackViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let text = pickerData[row]
        categoryTextField.text = text
        self.view.endEditing(true)
    }
}

extension AddHackViewController: UITextFieldDelegate {
    func setupTextField() {
        enterTidbitTextField.delegate = self
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == enterTidbitTextField {
            enterTidbitTextField.resignFirstResponder()
        }
    }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if textField == enterTidbitTextField {
                enterTidbitTextField.resignFirstResponder()
            }
            return true
        }
}
