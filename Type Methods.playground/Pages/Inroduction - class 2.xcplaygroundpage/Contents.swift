
class SomeClass {
	func instanceFunc() { print("instance func called") }
	static func typeMethod () { print("type method called") }
	
	let instanceProperty = "instance prop"
	var instancePropertyMutable = "instance prop mut"
	
	static let typePropImmut = "type prop imm"
	static var typePropMut = 1
	
	static func addOne() { typePropMut += 1 }
}

let instance = SomeClass()
instance.instanceFunc()
instance.instanceProperty
instance.instancePropertyMutable

SomeClass.typeMethod()
SomeClass.typePropImmut
SomeClass.typePropMut
SomeClass.typePropMut += 1
SomeClass.typePropMut

SomeClass.addOne()
SomeClass.typePropMut


struct SomeStruct {
	static func someFunc() { }
	static let someProp: String = ""
}

SomeStruct.someFunc()
SomeStruct.someProp


protocol SomeProtocol {
	static func someFunc ()
}

extension SomeProtocol {
	static func someFunc() { print ("protocol") }
}


















