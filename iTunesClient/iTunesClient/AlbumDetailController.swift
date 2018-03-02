//
//  AlbumDetailController.swift
//  iTunesClient
//
//  Created by Kristof Kocsis on 2018. 02. 09..
//  Copyright © 2018. Treehouse Island. All rights reserved.
//

import UIKit

class AlbumDetailController: UITableViewController {
	
	var album: Album? {
		didSet {
			self.title = album?.name
			dataSource.update(with: album!.songs)
			tableView.reloadData()
		}
	}
	
	var dataSource = AlbumDetailDataSource(songs: [])

	@IBOutlet weak var artworkView: UIImageView!
	@IBOutlet weak var albumTitleLabel: UILabel!
	@IBOutlet weak var albumGenreLabel: UILabel!
	@IBOutlet weak var albumReleaseDateLabel: UILabel!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if let album = album {
			configure(with: album)
		}
		
		tableView.dataSource = dataSource
    }
	
	func configure(with album: Album) {
		let viewModel = AlbumDetailViewModel(album: album)
		
		// TODO: Add implementation for artworkView
		albumTitleLabel.text = viewModel.title
		albumGenreLabel.text = viewModel.genre
		albumReleaseDateLabel.text = viewModel.releaseDate
	}
}









