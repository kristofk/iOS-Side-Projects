import Foundation
import UIKit

struct AlbumCellViewModel {
	let title: String
	let releaseDate: String
	let genre: String
	let artwork: UIImage
}

extension AlbumCellViewModel {
	init(album: Album) {
		self.artwork = album.artworkState == .downloaded ? album.artwork! : #imageLiteral(resourceName: "AlbumPlaceholder")
		self.title = album.censoredName
		self.genre = album.primaryGenre.name
		
		let formatter = DateFormatter()
		formatter.locale = Locale.current
		formatter.dateFormat = "MMM dd, yyyy"
		
		self.releaseDate = formatter.string(from: album.releaseDate)
	}
}











































