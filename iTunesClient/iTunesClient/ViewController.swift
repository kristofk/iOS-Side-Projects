import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let searchEndpoint = Itunes.search(term: "taylor swift", media: .music(entity: .musicArtist, attribute: .artistTerm))
		print(searchEndpoint.request)
		
		print("*************************")
		
		let lookupEndpoint = Itunes.lookup(id: 159260351, entity: MusicEntity.album)
		print(lookupEndpoint.request)
    }

	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

