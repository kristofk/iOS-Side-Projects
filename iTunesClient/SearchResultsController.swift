import UIKit

class SearchResultsController: UITableViewController {
	
	let searchController = UISearchController(searchResultsController: nil)
	let dataSource = SearchResultsDataSource()
	let client = ItunesAPIClient()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchResultsController.dismissSearchResultsController))
		
		tableView.tableHeaderView = searchController.searchBar
		tableView.dataSource = dataSource
		
		dataSource.printArtist()
		
		searchController.dimsBackgroundDuringPresentation = false
		searchController.searchResultsUpdater = self
		
		definesPresentationContext = true
	}
	
	func dismissSearchResultsController() {
		self.dismiss(animated: true, completion: nil)
	}
	
	// MARK: - Navigation
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showAlbums" {
			if let indexPath = tableView.indexPathForSelectedRow {
				let artist = dataSource.artist(at: indexPath)
				let albumListController = segue.destination as! AlbumListController
				
				client.lookupArtist(withId: artist.id) { artist, error in
					albumListController.artist = artist
					albumListController.tableView.reloadData()
				}
				
				
			}
		}
	}
}

extension SearchResultsController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		client.searchForArtists(withTerm: searchController.searchBar.text!) { [weak self] artists, error in
			
			if error == nil {
				self?.dataSource.update(with: artists)
				self?.tableView.reloadData()
			}
		}
	}
}
