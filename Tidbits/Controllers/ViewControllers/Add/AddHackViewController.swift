//
//  AddHackViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/30/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    //MARK: Outlets
    @IBOutlet weak var customTableView: UITableView!
    @IBOutlet weak var enterTidbitTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - Actions
    @IBAction func dropDownSelection(_ sender: UIButton) {
        allcategories.forEach { (category) in
            UIView.animate(withDuration: 0.3, animations: {
                category.isHidden = !category.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    enum Categories: String {
        case all = "All"
        
        case food = "Food"
        case party = "Party"
        case money = "Money"
        case tech = "Tech"
        case health = "Health"
        case favorite = "Favorite"
        case funny = "Funny"
    }
    
    @IBOutlet var allcategories: [UIButton]!
    
    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        // Sets w.e the title of w.e category is clicked
        guard let title = sender.currentTitle, let tidbitCategory = Categories(rawValue: title) else { return }
        
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
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
