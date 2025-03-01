// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IgniteStarter",
    platforms: [.macOS(.v13)],
    dependencies: [
		.package(url: "https://github.com/twostraws/Ignite.git", revision: "c2a22687c197a7d4c60df33845c8ad868970eab6")
    ],
    targets: [
        .executableTarget(
            name: "IgniteStarter",
            dependencies: ["Ignite"]),
    ]
)
