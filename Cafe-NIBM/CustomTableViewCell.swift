//
//  CustomTableViewCell.swift
//  Cafe-NIBM
//
//  Created by Lahiru on 3/6/21.
//  Copyright © 2021 Lahiru. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodDescriptionLbl: UILabel!
    @IBOutlet weak var foodPriceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
