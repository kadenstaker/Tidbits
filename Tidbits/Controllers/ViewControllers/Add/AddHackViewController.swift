//
//  AddHackViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/30/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class AddHackViewController: UITableViewController {
    
    //MARK: Outlets
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var enterTidbitTextField: UITextField!
    @IBOutlet weak var customTabbar2: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let viewController:UIViewController = UIStoryboard(name: "SignUp", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as UIViewController
    
    var photo: UIImage?
    var category: PostController.Categories?
    //MARK: - Actions
    @IBAction func dropDownSelection(_ sender: UIButton) {
        allcategories.forEach { (category) in
            UIView.animate(withDuration: 0.3, animations: {
                category.isHidden = !category.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }

    @IBOutlet var allcategories: [UIButton]!
    
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        // Sets w.e the title of w.e category is clicked
        guard let title = sender.currentTitle, let tidbitCategory = PostController.Categories(rawValue: title) else { return }
        self.category = tidbitCategory
        switch tidbitCategory {
        case .all :
            print("All category button was tapped")
        case .party :
            print("Fashion category button was tapped")
        case .favorite :
            print("Favorite Button Tapped")
        case .food :
        print("Food category button was tapped")
        case .health :
            print("Health button was tapped")
        case .money :
            print("Money button was tapped")
        case .tech :
            print("Tech button was tapped")
        case .funny :
            print("Funny button was tapped")
        default:
            print("Select a category button was tapped")
        }
    }
    
    @IBAction func postButtonTapped(_ sender: UIButton) {
        print("post button was tapped")
        guard let image = photo,
            let tidbit = enterTidbitTextField.text,
            !tidbit.isEmpty,
            let category = category else { return }
//        Create function
        PostController.shared.createPostWith(image: image, text: tidbit, category: category.rawValue, username: "") { (post) in
        }
        self.tabBarController?.selectedIndex = 0
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageSelector"{
            guard let destinationVC = segue.destination as? PhotoSelectorViewController else { return}
            destinationVC.delegate = self
        }
    }
}

extension AddHackViewController: PhotoSelectorViewControllerDelegate{
    
    func selectPhoto(_ photo: UIImage) {
        self.photo = photo
    }
}
