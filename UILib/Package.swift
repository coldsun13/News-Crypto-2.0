// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UILib",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "UILib",
            targets: ["UILib"]),
    ],
    dependencies: [
        .package(url: "https://github.com/danielgindi/Charts.git", from: "4.0.0"),
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "7.9.1")
    ],
    targets: [
        .target(
            name: "UILib",
            dependencies: [
                .product(name: "Charts", package: "Charts"),
                .product(name: "Kingfisher", package: "Kingfisher")
            ],
            resources: [
                .process("Montserrat-Bold.ttf"),
                .process("Montserrat-ExtraBold.ttf"),
                .process("Montserrat-Light.ttf"),
                .process("Montserrat-Medium.ttf"),
                .process("Montserrat-Regular.ttf"),
                .process("Montserrat-SemiBold.ttf")])
    ]
)
