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
        
        preparingForAnimation()
        animationChangeSegmentControl()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    /* Responsible for let the elements with the zero opacity */
    func preparingForAnimation() {
        
        self.data.alpha  = 0
        self.valor.alpha = 0
        self.nome.alpha  = 0
        
    }
    
    /* Responsible for let the elements with the high visibility */
    func animationChangeSegmentControl() {
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
            
            self.data.alpha  = 1
            self.valor.alpha = 1
            self.nome.alpha  = 1
            
            }, completion: nil)
        
    }
    
    
}
