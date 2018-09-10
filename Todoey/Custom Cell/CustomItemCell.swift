//
//  CustomItemCell.swift
//  Todoey
//
//  Created by Paul Izzett on 10/9/18.
//  Copyright © 2018 Paul Izzett. All rights reserved.
//

import UIKit

class CustomItemCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var doneImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
