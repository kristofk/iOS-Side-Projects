import Foundation

extension String {
	func addingPercentEncoding() -> String {
		return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
	}
}


func encodeParametersInUrl(_ parameters: [String: Any]) -> String {
	
	let sortedKeys = parameters.keys.sorted(by: { $0 < $1 })
	var components = [(String, String)]()
	
	for key in sortedKeys {
		let value = parameters[key]!
		let queryComponents = queryComponentsWith(key: key, value: value)
		components.append(contentsOf: queryComponents)
	}
	
	let encodedComponents = components.map { "\($0)=\($1)" }
	return encodedComponents.joined(separator: "&")
}


func queryComponentsWith(key: String, value: Any) -> [(String, String)] {
	var components = [(String, String)]()
	
	if let dictionary = value as? [String: Any] {
		for (nestedKey, value) in dictionary {
			let nestedComponents = queryComponentsWith(key: "\(key)[\(nestedKey)]", value: value)
			components.append(contentsOf: nestedComponents)
		}
	} else if let array = value as? [Any] {
		for value in array {
			let nestedComponents = queryComponentsWith(key: "\(key)[]", value: value)
			components.append(contentsOf: nestedComponents)
		}
	} else {
		let encodedKey = key.addingPercentEncoding()
		let encodedValue = "\(value)".addingPercentEncoding()
		
		let component = (encodedKey, encodedValue)
		components.append(component)
	}
	
	return components
}

//let parameters = ["foo": "bar", "dic": ["one": 1, "two": 2], "arr": ["A", "B", "C"]] as [String : Any]

let parameters = ["dic1": ["one": ["A": "1st", "B": "2nd"], "two": 2]]

//encodeParametersInUrlWith(parameters).removingPercentEncoding











