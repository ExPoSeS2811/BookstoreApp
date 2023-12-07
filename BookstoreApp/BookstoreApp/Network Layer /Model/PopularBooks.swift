import Foundation

struct Welcome: Codable {
    let docs: [Doc]
}

struct Doc: Codable {
    let title: String
    let publishYear: [Int]?
    let numberOfPagesMedian: Int?
    let ratingsAverage: Double?
    let currentlyReadingCount, alreadyReadCount: Int?
    let language: [String]?
    let authorName: [String]
    let authorAlternativeName: [String]?
    let subtitle: String?

    enum CodingKeys: String, CodingKey {
        case title
        case publishYear = "publish_year"
        case numberOfPagesMedian = "number_of_pages_median"
        case ratingsAverage = "ratings_average"
        case currentlyReadingCount = "currently_reading_count"
        case alreadyReadCount = "already_read_count"
        case language
        case authorName = "author_name"
        case authorAlternativeName = "author_alternative_name"
        case subtitle
    }
}
