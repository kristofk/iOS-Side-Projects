// Type Methods

class SomeClass {
	
	static var staticVar = "Static Var String"
	var instanceVar = "Instance Var String"
	class func someTypeMethod() -> String { return "SomeClass - type" }
}

class AnotherClass: SomeClass {
	func someTypeMethod() -> String { return "AnotherClass - instance" }
	override class func someTypeMethod() -> String { return "AnotherClass - type" }
}

SomeClass.someTypeMethod()
AnotherClass.someTypeMethod()

let anotherClass = AnotherClass()
anotherClass.someTypeMethod()




struct SomeStruct {
//	class func someStructMethod () -> String { return "some struct method" }
}


protocol SomeProtocol {
	static func someFunc() -> String
}

extension SomeProtocol {
	static func someFunc() -> String { return "protocol extension"}
}

class class1: SomeProtocol {
//	static func someFunc() -> String {
//		return "class conformance"
//	}
}
class1.someFunc()

