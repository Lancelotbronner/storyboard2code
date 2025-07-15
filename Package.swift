// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "storyboard2code",
	platforms: [
		.macOS(.v13),
	],
    dependencies: [
		.package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
		
        .package(url: "https://github.com/CoreOffice/XMLCoder.git", from: "0.17.1"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", from: "2.7.1"),
    ],
    targets: [
		.target(name: "StoryboardModel", dependencies: [
			"XMLCoder",
		]),
		
		.target(
			name: "StoryboardConverter",
			dependencies: ["XMLCoder", "StencilSwiftKit", "StoryboardModel"]),
		
        .executableTarget(
            name: "storyboard2code",
            dependencies: [
				.product(name: "ArgumentParser", package: "swift-argument-parser"),
				"StoryboardConverter",
			]),
    ]
)
