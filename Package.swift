import PackageDescription

let package = Package(
    name: "Pjango-MySQL",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/enums/Pjango.git", majorVersion: 0),
        .Package(url: "https://github.com/PerfectlySoft/Perfect-MySQL.git", majorVersion: 2),
    ]
)
