// swift-tools-version:5.10

import PackageDescription

let package = Package(
  name: "RxDataSources",
  platforms: [
    .iOS(.v12), .tvOS(.v12)
  ],
  products: [
    .library(name: "RxDataSources", targets: ["RxDataSources"]),
    .library(name: "RxDataSources-Dynamic", type: .dynamic, targets: ["RxDataSources"]),
    .library(name: "Differentiator", targets: ["Differentiator"])
  ],
  dependencies: [
    .package(url: "https://github.com/FountainheadMobileSolutions/RxSwift.git", .upToNextMajor(from: "6.8.0")),
  ],
  targets: [
    .target(
      name: "RxDataSources", 
      dependencies: [
        .target(name: "Differentiator"), 
        .product(name: "RxSwift", package: "RxSwift"), 
        .product(name: "RxCocoa", package: "RxSwift"),
      ]
    ),
    .target(name: "Differentiator"),
    .testTarget(name: "RxDataSourcesTests", dependencies: ["RxDataSources"])
  ],
  swiftLanguageVersions: [.v5]
)
