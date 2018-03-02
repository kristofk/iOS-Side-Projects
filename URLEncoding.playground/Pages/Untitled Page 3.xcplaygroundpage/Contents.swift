import Foundation

// Deal with esc chars

// Encode Dictionaries, Arrays, Types
/*

Dictionaries
<dict name>[<key>]=<value>

Arrays
<arr name>[]=<value>

Types
<key>=<value>

*/

extension String {
	func addingPercentEncoding() -> String {
		return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
	}
}



func encodeToUrlQueryParams(_ parameters: [String: Any]) -> String {
	
	var components = [(String, String)]()
	let sortedKeys = parameters.keys.sorted(by: { $0 < $1 })
	
	for key in sortedKeys {
		let value = parameters[key]!
		let valueComponents = toQueryComponents(key: key, value: value)
		components.append(contentsOf: valueComponents)
	}
	
	let strComponents = components.map { "\($0)=\($1)" }
	let urlEncodedParams = strComponents.joined(separator: "&")
	return urlEncodedParams.addingPercentEncoding()
}


func toQueryComponents(key: String, value: Any) -> [(String, String)] {
	
	var components = [(String, String)]()
	
	if let dictionary = value as? [String: Any] {
		for (nestedKey, value) in dictionary {
			let comps = toQueryComponents(key: "\(key)[\(nestedKey)]", value: value)
			components.append(contentsOf: comps)
		}
	} else if let array = value as? [Any] {
		for element in array {
			components.append((key, "\(element)"))
		}
	} else {
		components.append((key, "\(value)"))
	}
	
	return components
}





var parameters = ["dic1": ["one": ["A": "1st", "B": "2nd"], "two": 2]]

encodeToUrlQueryParams(parameters)
encodeToUrlQueryParams(parameters).removingPercentEncoding













