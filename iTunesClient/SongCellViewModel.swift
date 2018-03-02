import Foundation

struct SongCellViewModel {

	let songTitle: String
	let songDuration: String
}

extension SongCellViewModel {
	init(song: Song) {
		self.songTitle = song.name
		
		let trackLengthSEC = song.trackTime / 1000
		let min = trackLengthSEC / 60
		let sec = trackLengthSEC % 60
		
		self.songDuration = "\(min):\(sec)"
	}
}
