//
//  TodoTableViewCell.swift
//  TodoList
//
//  Created by krishnaveni kulkarni on 16/06/18.
//  Copyright © 2018 krishnaveni kulkarni. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    

    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
