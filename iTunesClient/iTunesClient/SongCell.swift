//
//  SongCell.swift
//  iTunesClient
//
//  Created by Kristof Kocsis on 2018. 02. 10..
//  Copyright © 2018. Treehouse Island. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
	
	static let reuseIdentifier = "SongCell"
	
	@IBOutlet weak var songNameLabel: UILabel!
	@IBOutlet weak var songDuration: UILabel!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	
	func configure(with viewModel: SongCellViewModel) {
		self.songNameLabel.text = viewModel.songTitle
		self.songDuration.text = viewModel.songDuration
	}
}
