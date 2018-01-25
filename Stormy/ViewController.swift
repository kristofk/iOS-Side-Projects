//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
	
	@IBOutlet weak var currentTemperatureLabel: UILabel!
	@IBOutlet weak var currentHumidityLabel: UILabel!
	@IBOutlet weak var currentPrecipitationLabel: UILabel!
	@IBOutlet weak var currentWeatherIcon: UIImageView!
	@IBOutlet weak var currentSummaryLabel: UILabel!
	@IBOutlet weak var refreshButton: UIButton!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var place: UILabel!
	
	let client = DarkSkyAPIClient()
	let locationManager = CLLocationManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		//		locationManager.requestLocation()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		//		getCurrentWeather()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func displayWeather(using viewModel: CurrentWeatherViewModel) {
		currentTemperatureLabel.text = viewModel.temperature
		currentHumidityLabel.text = viewModel.humidity
		currentPrecipitationLabel.text = viewModel.percipitationProbability
		currentSummaryLabel.text = viewModel.summary
		currentWeatherIcon.image = viewModel.icon
//		place.text = ""
		lookUpCurrentLocation { placeMarker in
			if let placeName = placeMarker?.locality {
				self.place.text = placeName
			}
		}
	}
	
	@IBAction func getCurrentWeather() {
		toggleRefreshAnimation(on: true)
		locationManager.requestLocation()
	}
	
	func getCurrentWeatherFor(lat: Double, long: Double) {
		print("Coord: \(lat), \(long)")
		let coordinate = Coordinate(latitude: lat, longitude: long)
		
		client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
			if let currentWeather = currentWeather {
				let viewModel = CurrentWeatherViewModel(model: currentWeather)
				self.displayWeather(using: viewModel)
				self.toggleRefreshAnimation(on: false)
			}
			if let error = error {
				print("Error - didn't get the current weather")
				self.showAlertWith(title: error.title, description: error.description)
			}
		}
	}
	
	func toggleRefreshAnimation(on: Bool) {
		refreshButton.isHidden = on
		if on {
			activityIndicator.startAnimating()
		} else {
			activityIndicator.stopAnimating()
		}
	}
	
	func showAlertWith(title: String, description desc: String) {
		print("Alert should be shown")
		let alertController = UIAlertController(title: title, message: desc, preferredStyle: .alert)
		let action = UIAlertAction(title: "OK", style: .default, handler: nil)
		alertController.addAction(action)
		self.present(alertController, animated: true, completion: nil)
	}
}

extension ViewController: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
		if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
			getCurrentWeatherFor(lat: lat, long: long)
		}
	}
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error)
	}
	
	func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?) -> Void ) {
		// Use the last reported location.
		if let lastLocation = self.locationManager.location {
			let geocoder = CLGeocoder()
			
			// Look up the location and pass it to the completion handler
			geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
				if error == nil {
					let firstLocation = placemarks?[0]
					completionHandler(firstLocation)
				}
				else {
					// An error occurred during geocoding.
					completionHandler(nil)
				}
			})
		}
		else {
			// No location was available.
			completionHandler(nil)
		}
	}
}
















