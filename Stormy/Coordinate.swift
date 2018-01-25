//
//  Coordinate.swift
//  Stormy
//
//  Created by Kristof Kocsis on 2018. 01. 08..
//  Copyright © 2018. Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
	let latitude: Double
	let longitude: Double
}

extension Coordinate: CustomStringConvertible {
	var description: String {
		return "\(latitude),\(longitude)"
	}
}
