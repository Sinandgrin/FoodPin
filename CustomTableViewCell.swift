//
//  CustomTableViewCell.swift
//  FoodPin
//
//  Created by Andrew Hansen on 10/10/14.
//  Copyright (c) 2014 Andrew Hansen. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var locationLabel : UILabel!
    @IBOutlet weak var typeLabel : UILabel!
    @IBOutlet weak var thumbnailImageView : UIImageView!
    @IBOutlet weak var favorIconImageView : UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
