//
//  PricesCell.swift
//  Prices
//
//  Created by Subramanyam Mogili on 7/22/17.
//  Copyright © 2017 Subramanyam Mogili. All rights reserved.
//

import UIKit

class PricesCell: UITableViewCell {

    @IBOutlet weak var Cityname: UILabel!
    @IBOutlet weak var PetrolPrice: UILabel!
    @IBOutlet weak var DieselPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
