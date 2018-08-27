//
//  TableViewCell.swift
//  profileEffect
//
//  Created by Luis Castillo on 26/08/18.
//  Copyright © 2018 Luis Castillo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var txtUserName: UILabel!
    @IBOutlet weak var txtComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
