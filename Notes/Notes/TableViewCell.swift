//
//  TableViewCell.swift
//  Notes
//
//  Created by Ильдар Нигметзянов on 07/08/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellColor.layer.borderWidth = 1
    }

    @IBOutlet weak var cellColor: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellText: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
