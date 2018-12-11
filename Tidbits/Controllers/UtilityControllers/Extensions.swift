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

