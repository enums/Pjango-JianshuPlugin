import PackageDescription

let package = Package(
    name: "Pjango-JianshuPlugin",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/enums/Pjango.git", majorVersion: 0),
        .Package(url: "https://github.com/enums/SwiftyJSON.git", majorVersion: 4),
    ]
)
