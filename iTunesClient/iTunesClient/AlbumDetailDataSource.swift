import UIKit

class AlbumDetailDataSource: NSObject, UITableViewDataSource {
	
	private var songs: [Song]
	
	init(songs: [Song]) {
		self.songs = songs
	}
	
	// MARK: - Data Source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return songs.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let songCell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
		
		let song = songs[indexPath.row]
		let viewModel = SongCellViewModel(song: song)
		
		songCell.configure(with: viewModel)
		
		return songCell
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		switch section {
		case 0:
			return "Tracks"
		default:
			return nil
		}
	}
	
	// MARK: - Helper
	
	func update(with songs: [Song]) {
		self.songs = songs
	}
}





































