// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "UILabel+Copyable",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "UILabel+Copyable",
            targets: ["UILabel+Copyable"]),
    ],
    dependencies: [
        // no dependencies
    ],
    targets: [
        .target(
            name: "UILabel+Copyable",
            dependencies: [],
            path: "UILabel+Copyable"),
        .testTarget(
            name: "UILabel+CopyableTests",
            dependencies: ["UILabel+Copyable"],
            path: "UILabel+CopyableTests"),
    ]
)
