import UIKit

// URL

let siteGoogle = "https://google.com?q=1&password=1212"

let url = URL(fileURLWithPath: siteGoogle)

url.relativeString
url.absoluteString
url.baseURL
url.lastPathComponent
url.pathExtension
url.query


// URLComponents
var urlComponents = URLComponents(string: siteGoogle)

urlComponents?.scheme
urlComponents?.query
urlComponents?.url
urlComponents?.host
urlComponents?.path
urlComponents?.password

enum Sorting: String {
    case numberOfStars = "stars"
    case numberOfForks = "forks"
    case recency = "updated"
}

func findRepositories(matching query: String, sortedBy sorting: Sorting) -> URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.github.com"
    components.path = "/search/repositories"
    components.queryItems = [ // Запомнить
        URLQueryItem(name: "q", value: query),
        URLQueryItem(name: "sort", value: sorting.rawValue)
    ]

    let url = components.url
    return url!
}


let result = findRepositories(matching: "hello", sortedBy: .numberOfStars)


struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func search(matching query: String, sortedBy sorting: Sorting = .recency) -> Endpoint {
        return Endpoint(
            path: "/search/repositories",
            queryItems: [
                URLQueryItem(name: "q", value: query),
                URLQueryItem(name: "sort", value: sorting.rawValue)
            ]
        )
    }
}

// Bundle

let bundle = Bundle.main
bundle.bundleURL
bundle.bundleIdentifier
bundle.localizedString(forKey: "Hello, %@", value: "Hello, ${username}", table: nil)
