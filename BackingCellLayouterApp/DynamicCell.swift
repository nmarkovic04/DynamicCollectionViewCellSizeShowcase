//
//  DynamicCell.swift
//  BackingCellLayouterApp
//
//  Created by Nikola Markovic on 3/17/16.
//  Copyright © 2016 XD. All rights reserved.
//

import UIKit

class DynamicCell: UICollectionViewCell {

    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 0.7
    }

}
