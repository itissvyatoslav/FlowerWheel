//
//  DataModel.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 01.08.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import Foundation

class DataModel {
    var isPayed = false
    var cameFromPay = false
    
    static let sharedData = DataModel()
}
