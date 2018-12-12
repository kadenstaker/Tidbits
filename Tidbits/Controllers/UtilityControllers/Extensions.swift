//
//  Extensions.swift
//  Tidbits
//
//  Created by Xavier on 12/10/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import UIKit

extension Date {
    func formatLong() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let formattedDate = formatter.string(from: self)
        return formattedDate
    }
}

extension UITextField {
    func boarderForBottom(backGroundColor: UIColor, borderColor:UIColor){
        self.layer.backgroundColor = backGroundColor.cgColor
        
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
        self.layer.borderColor = borderColor.cgColor

    }
}

