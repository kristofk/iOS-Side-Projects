
struct LevelTracker {
	static var highestUnlockedLevel = 1
	var currentLevel = 1
	
	static func unlock(_ level: Int) {
		if level > highestUnlockedLevel { highestUnlockedLevel = level }
	}
	
	static func isUnlocked(_ level: Int) -> Bool {
		return level <= highestUnlockedLevel
	}
	
	@discardableResult
	mutating func advance(to level: Int) -> Bool {
		if LevelTracker.isUnlocked(level) {
			currentLevel = level
			return true
		} else {
			return false
		}
	}
}

class Player {
	var tracker = LevelTracker()
	let playerName: String
	func complete(level: Int) {
		LevelTracker.unlock(level + 1)
		tracker.advance(to: level + 1)
	}
	init(name: String) {
		playerName = name
	}
}


let player1 = Player(name: "Player1")
player1.complete(level: 1)
player1.complete(level: 2)
player1.complete(level: 4)
print("Highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

let player2 = Player(name: "Player2")
player2.tracker.advance(to: 5)


class SomeClass {
	static func someFunc () { }
	static let someProp = ""
}
SomeClass.someFunc()
SomeClass.someProp


