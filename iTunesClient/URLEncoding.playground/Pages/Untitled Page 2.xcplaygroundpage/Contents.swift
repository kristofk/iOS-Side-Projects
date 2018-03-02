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

func encodeParametersInURL(_ parameters: [String: Any]) -> String {
	
	let orderedKeys = parameters.keys.sorted(by: { $0 > $1 })
	var components = [(String, String)]()
	for key in orderedKeys {
		let value = parameters[key]
		let comps = toQueryStringProperties(key: key, value: value!)
		components.append(contentsOf: comps)
	}
	
	let strComponents = components.map { "\($0)=\($1)"}
	return strComponents.joined(separator: "&").addingPercentEncoding()
	
}

func toQueryStringProperties(key: String, value: Any) -> [(String, String)] {
	
	var components = [(String, String)]()
	
	if let dictionary = value as? [String: Any] {
		for (nestedKey, value) in dictionary {
			let comp = toQueryStringProperties(key: "\(key)[\(nestedKey)]", value: value)
			components.append(contentsOf: comp)
		}
	} else if let values = value as? [Any] {
		for value in values {
			let strKey = "\(key)[]".addingPercentEncoding()
			let strValue = "\(value)".addingPercentEncoding()
			components.append((strKey, strValue))
		}
	} else {
		let strValue = "\(value)".addingPercentEncoding()
		let strKey = "\(key)".addingPercentEncoding()
		components.append((strKey, strValue))
	}
	
	return components
}




let parameters = ["dic1": ["one": ["A": "1st", "B": "2nd"], "two": 2]]

print(encodeParametersInURL(parameters))
print(encodeParametersInURL(parameters).removingPercentEncoding!)





















