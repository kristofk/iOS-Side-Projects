//
//  AlbumListController.swift
//  iTunesClient
//
//  Created by Kristof Kocsis on 2018. 02. 08..
//  Copyright © 2018. Treehouse Island. All rights reserved.
//

import UIKit

class AlbumListController: UITableViewController {

	let client = ItunesAPIClient()
	
	private struct Constants {
		static let AlbumCellHeight: CGFloat = 80
	}
	
	var artist: Artist? {
		didSet {
			self.title = artist?.name
			dataSource.update(with: artist!.albums)
			tableView.reloadData()
		}
	}
	
	lazy var dataSource: AlbumListDataSource = {
		return AlbumListDataSource(albums: [], tableView: self.tableView)
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableView.dataSource = dataSource
    }
	
	// MARK: - Tabel View Delegate
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return Constants.AlbumCellHeight
	}
	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showAlbum" {
			if let indexPath = tableView.indexPathForSelectedRow {
				let selectedAlbum = dataSource.album(at: indexPath)
				let albumDetailController = segue.destination as! AlbumDetailController
				
				client.lookupAlbum(withId: selectedAlbum.id) { album, error in
					albumDetailController.album = album
				}				
			}
		}
	}
	
	
	
}





