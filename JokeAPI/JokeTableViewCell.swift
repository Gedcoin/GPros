//
//  JokeTableViewCell.swift
//  JokeAPI
//
//  Created by Gedcoin Maboya on 2020/05/19.
//  Copyright © 2020 LTI. All rights reserved.
//

import UIKit

class JokeTableViewCell: UITableViewCell {

    @IBOutlet weak var jokeTypeLabel: UILabel!
    @IBOutlet weak var jokeSetup: UILabel!
    @IBOutlet weak var jokeDelivery: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
