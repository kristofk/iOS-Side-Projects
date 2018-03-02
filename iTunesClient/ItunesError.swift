import Foundation

enum ItunesError: Error {
	case requestFailed
	case responseUnsuccessful
	case invalidData
	case jsonConverionFailure
	case jsonParsingFailure(message: String)
}

