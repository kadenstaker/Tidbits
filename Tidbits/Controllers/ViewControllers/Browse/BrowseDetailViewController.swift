//
//  BrowseDetailViewController.swift
//  Tidbits
//
//  Created by Xavier on 11/29/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

class BrowseDetailViewController: UIViewController {
    
    //Mark: - Outlets
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailDateLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func heartButtonTapped(_ sender: UIButton) {
    }
//    @IBAction func shareButtonTapped(_ sender: Any) {
//    }
    @IBAction func otherButtonTapped(_ sender: UIButton) {
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
