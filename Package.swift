// swift-tools-version:5.5
import PackageDescription

let package = Package(
	name: "swift-terminal-game",
	products: [
		.executable(name: "swift-terminal-game", targets: ["swift-terminal-game"]),
	],
	dependencies: [],
	targets: [
		.executableTarget(name: "swift-terminal-game", dependencies: [])
	]
)
