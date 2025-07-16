// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "storyboard2code",
	platforms: [
		.macOS(.v13),
	],
    dependencies: [
		.package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
		
        .package(url: "https://github.com/Lancelotbronner/swift-xml.git", branch: "main"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", from: "2.7.1"),
    ],
    targets: [
		.target(name: "StoryboardModel", dependencies: [
			.product(name: "SwiftXML", package: "swift-xml"),
		]),
		
		.target(
			name: "StoryboardConverter",
			dependencies: [
				.product(name: "SwiftXML", package: "swift-xml"),
				"StencilSwiftKit",
				"StoryboardModel"
			]),
		
        .executableTarget(
            name: "storyboard2code",
            dependencies: [
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
				"StoryboardConverter",
			]),
    ]
)
