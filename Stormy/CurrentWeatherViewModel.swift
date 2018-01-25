//
//  CurrentWeatherViewModel.swift
//  Stormy
//
//  Created by Kristof Kocsis on 2018. 01. 03..
//  Copyright © 2018. Treehouse. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeatherViewModel {
	let temperature: String
	let humidity: String
	let percipitationProbability: String
	let summary: String
	let icon: UIImage
	let place: String
	
	init(model: CurrentWeather) {
		let roundedTemperature = Int(model.temperature)
		self.temperature = "\(roundedTemperature)º"
		
		let humidityPercentValue = Int(model.humidity * 100)
		self.humidity = "\(humidityPercentValue)%"
		
		let precipPercentValue = Int(model.precipitationProbability * 100)
		self.percipitationProbability = "\(precipPercentValue)%"
		
		self.summary = model.summary
		
		let weatherIcon = WeatherIcon(iconString: model.icon)
		self.icon = weatherIcon.image
		
		self.place = model.place
	}
}








