import Foundation

class URLGenerator {
    private let baseURL = "https://openlibrary.org/search.json?"
    private let popularBooks = "popular"
    
    func fetchPopularBooks() {
        guard let baseURL = URL(string: baseURL) else { return nil }
    }
}
