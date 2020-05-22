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
    @IBOutlet weak var jokeSetupLabel: UILabel!
    @IBOutlet weak var jokeDeliveryLabel: UILabel!
    
    @IBOutlet weak var jokeTypeTextLabel: UILabel!
    @IBOutlet weak var jokeSetupTextLabel: UILabel!
    @IBOutlet weak var jokeDeliveryTextLabel: UILabel!
    
    @IBOutlet weak var singleJokeHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
