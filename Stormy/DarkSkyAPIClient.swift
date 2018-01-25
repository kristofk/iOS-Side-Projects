//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Kristof Kocsis on 2018. 01. 08..
//  Copyright © 2018. Treehouse. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
	fileprivate let apiKey = "e5e0b7b6d2ffc0c675d1b85896bd5a4d"
	lazy var baseUrl: URL = {
		return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!
	}()
	
	let downloader = JSONDownloader()
	
	typealias currentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
	
	func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping currentWeatherCompletionHandler) {
		guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
			completion(nil, .invalidURL)
			return
		}	
		
		let request = URLRequest(url: url)
		let task = downloader.jsonTask(with: request) { json, error in
			
			DispatchQueue.main.async {
				guard let json = json else {
					print("some error")
					completion(nil, error)
					return
				}
				
				guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
					print("some error")
					completion(nil, .jsonParsingFailure) // MARK: jsonParsingError
					return
				}
				
				if let error = error {
					print("some error")
					completion(nil, error)
				}
				
//				print("right before completion")
				completion(currentWeather, nil)
			}
		}
		
		task.resume()
	}
}
