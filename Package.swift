// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "AMToast",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "AMToast",
            targets: ["AMToast"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AMToast",
            dependencies: [],
            path: "Sources/AMToast",
            resources: [
                .process("Assets")
            ]
        ),
        .testTarget(
            name: "AMToastTests",
            dependencies: ["AMToast"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
) 