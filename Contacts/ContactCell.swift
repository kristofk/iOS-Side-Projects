//
//  ContactCell.swift
//  Contacts
//
//  Created by Kristof Kocsis on 2018. 01. 26..
//  Copyright © 2018. Kristof Kocsis. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

	@IBOutlet weak var profileImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var favoriteIcon: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
