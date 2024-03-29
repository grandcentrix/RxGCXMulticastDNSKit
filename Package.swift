// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RxGCXMulticastDNSKit",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "RxGCXMulticastDNSKit",
            targets: ["RxGCXMulticastDNSKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(url: "https://github.com/grandcentrix/GCXMulticastDNSKit.git", .upToNextMinor(from: "1.4.0"))
    ],
    targets: [
        .target(
            name: "RxGCXMulticastDNSKit",
            dependencies: ["RxSwift", "GCXMulticastDNSKit"],
            path: "RxGCXMulticastDNSKit"),
        .testTarget(
            name: "RxGCXMulticastDNSKitTests",
            dependencies: ["RxGCXMulticastDNSKit"],
            path: "RxGCXMulticastDNSKitTests"),
    ],
    swiftLanguageVersions: [.v5]
)
