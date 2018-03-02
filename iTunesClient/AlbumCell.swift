import UIKit

class AlbumCell: UITableViewCell {
	
	static let reuseIdentifier = "AlbumCell"
	
	@IBOutlet weak var artworkView: UIImageView!
	@IBOutlet weak var albumTitleLabel: UILabel!
	@IBOutlet weak var genreLable: UILabel!
	@IBOutlet weak var releaseDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	func configure(with viewModel: AlbumCellViewModel) {
		artworkView.image = viewModel.artwork
		albumTitleLabel.text = viewModel.title
		genreLable.text = viewModel.genre
		releaseDateLabel.text = viewModel.releaseDate
	}
}
