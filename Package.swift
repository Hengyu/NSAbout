// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NSAbout",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "NSAbout", targets: ["NSAbout"])
    ],
    targets: [
        .target(name: "NSAbout", dependencies: []),
        .testTarget(name: "NSAboutTests", dependencies: ["NSAbout"])
    ]
)
