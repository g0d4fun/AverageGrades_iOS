//
//  TableViewCell.swift
//  GradesAverage
//
//  Created by Rafael Filipe Carreira Henriques on 04/01/2018.
//  Copyright © 2018 Rafael Filipe Carreira Henriques. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var UIGrade: UITextField!
    @IBOutlet weak var UIClassName: UILabel!
    @IBOutlet weak var UIEcts: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
