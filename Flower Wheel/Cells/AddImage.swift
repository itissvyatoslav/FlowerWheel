//
//  AddImage.swift
//  Flower Wheel
//
//  Created by Svyatoslav Vladimirovich on 03.08.2020.
//  Copyright © 2020 Svyatoslav Vladimirovich. All rights reserved.
//

import UIKit

class AddImage: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.clipsToBounds = true
        // Initialization code
    }

}
