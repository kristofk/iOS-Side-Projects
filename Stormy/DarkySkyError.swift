//
//  DarkySkyError.swift
//  Stormy
//
//  Created by Kristof Kocsis on 2018. 01. 04..
//  Copyright © 2018. Treehouse. All rights reserved.
//

import Foundation


enum DarkSkyError: Error {
	case requestFailed
	case responseUnsuccessful
	case invalidData
	case jsonConversionError
	case invalidURL
	case jsonParsingFailure
}

extension DarkSkyError {
	var title: String {
		switch self {
		case .requestFailed: return "Request failed"
		case .responseUnsuccessful: return "Server error"
		case .invalidData: return "No data"
		case .jsonConversionError: return "Unconvertable"
		case .invalidURL: return "No URL"
		case .jsonParsingFailure: return "Missing data"
		}
	}
	var description: String {
		switch self {
		case .requestFailed: return "No response recieved from the server."
		case .responseUnsuccessful: return "The server couldn't process request."
		case .invalidData: return "The recieved response is corrupt."
		case .jsonConversionError: return "Could not convert json to processable data."
		case .invalidURL: return "Could not creat the required URL."
		case .jsonParsingFailure: return "Didn't find relevant data in the data."
		}
	}
}

