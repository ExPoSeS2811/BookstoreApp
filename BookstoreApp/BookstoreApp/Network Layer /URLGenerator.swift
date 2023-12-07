import Foundation

enum BaseURLTypes {
    case booksData
    case coverData

    var url: String {
        switch self {
        case .booksData:
            return "https://openlibrary.org/"
        case .coverData:
            return "https://covers.openlibrary.org/"
        }
    }
}

class URLRequestGeneratore {
    private let baseURL = "https://openlibrary.org/"

    func request(
        baseURL: BaseURLTypes = .booksData,
        endpoint: String,
        queryItems: [URLQueryItem] = []
    ) -> URLRequest? {
        guard let baseURL = URL(string: baseURL.url) else { return nil }
        var components = URLComponents(url: baseURL.appendingPathComponent(endpoint), resolvingAgainstBaseURL: true)

        var defaultQueryItems = [URLQueryItem]()
        defaultQueryItems.append(contentsOf: queryItems)
        if !defaultQueryItems.isEmpty {
            components?.queryItems = defaultQueryItems
        }

        guard let url = components?.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
}
