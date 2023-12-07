import Foundation

struct BookModel: Codable {
    let docs: [Books]
}

struct Books: Codable {
    let coverEditionKey: String?
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
        case coverEditionKey = "cover_edition_key"
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
