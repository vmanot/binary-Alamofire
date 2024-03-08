// swift-tools-version: 5.9

import CompilerPluginSupport
import PackageDescription

let repo = "https://github.com/vmanot/binary-Alamofire/raw/1.0.9001/"
let modules = ["AlamofireDynamic", "Alamofire"]

let package = Package(
    name: "Alamofire",

                      platforms: [.macOS(.v10_13),
                                  .iOS(.v12),
                                  .tvOS(.v12),
                                  .watchOS(.v4)],

    products: modules.map {
      .library(name: $0, type: .static, targets: [$0, "Alamofire_Binder"]
    ) },


    targets: [
        .target(name: "Alamofire_Binder", dependencies: modules.map { .target(name: $0) }),
        .binaryTarget(
            name: "AlamofireDynamic",
            url: repo + "AlamofireDynamic.xcframework.zip",
            checksum: "a9f65375df3400011a2cab75b5762615c116ed419207afd6910af0797f4a13f9"
        ),
        .binaryTarget(
            name: "Alamofire",
            url: repo + "Alamofire.xcframework.zip",
            checksum: "4ca892446339146033280ce9be434a47a035721befac7b2c5f51925708e35fad"
        ),
    ]
)
