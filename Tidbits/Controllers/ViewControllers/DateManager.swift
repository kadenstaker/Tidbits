//
//  DateManager.swift
//  Tidbits
//
//  Created by Xavier on 11/30/18.
//  Copyright © 2018 Kaden Staker. All rights reserved.
//

import Foundation

class DateManager {
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        //        formatter.timeStyle = .short
        return formatter
    }()
}
