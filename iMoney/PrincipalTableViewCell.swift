//
//  PrincipalTableViewCell.swift
//  iMoney
//
//  Created by Student on 7/18/16.
//  Copyright © 2016 Student. All rights reserved.
//

import UIKit

class PrincipalTableViewCell: UITableViewCell {

    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var valor: UILabel!
    @IBOutlet weak var nome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
