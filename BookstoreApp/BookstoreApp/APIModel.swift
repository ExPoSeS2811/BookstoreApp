//
//  APIModel.swift
//  BookstoreApp
//
//  Created by Timofey Spodeneyko on 07.12.2023.
//

import Foundation

struct Book: Codable {
    let title: String
    let authorName: [String]
    let firstPublishYear: Int
}

struct SearchResponse: Codable {
    let start: Int
    let numFound: Int
    let docs: [Book]
}

struct Author: Codable {
    let key: String
    let name: String
    let birthDate: String
    let topWork: String
    let workCount: Int
}

struct SearchAuthorsResponse: Codable {
    let numFound: Int
    let start: Int
    let numFoundExact: Bool
    let docs: [Author]
}

enum APIError: Error {
    case requestFailed
    case invalidData
}

func searchBooks(query: String, completion: @escaping (Result<[Book], Error>) -> Void) {
    let baseURL = "https://openlibrary.org/search.json"
    let queryItems = [
        URLQueryItem(name: "q", value: query)
    ]

    var urlComponents = URLComponents(string: baseURL)
    urlComponents?.queryItems = queryItems

    guard let url = urlComponents?.url else {
        completion(.failure(APIError.requestFailed))
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(APIError.invalidData))
            return
        }

        do {
            let decoder = JSONDecoder()
            let searchResponse = try decoder.decode(SearchResponse.self, from: data)
            completion(.success(searchResponse.docs))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

func searchBooksByAuthor(authorQuery: String, completion: @escaping (Result<[Author], Error>) -> Void) {
    let baseURL = "https://openlibrary.org/search/authors.json"
    let queryItems = [
        URLQueryItem(name: "q", value: authorQuery)
    ]

    var urlComponents = URLComponents(string: baseURL)
    urlComponents?.queryItems = queryItems

    guard let url = urlComponents?.url else {
        completion(.failure(APIError.requestFailed))
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(APIError.invalidData))
            return
        }

        do {
            let decoder = JSONDecoder()
            let searchAuthorsResponse = try decoder.decode(SearchAuthorsResponse.self, from: data)
            completion(.success(searchAuthorsResponse.docs))
        } catch {
            completion(.failure(error))
        }
    }.resume()
}

// Примеры использования функций поиска книг и поиска книг по автору
searchBooks(query: "The Lord of the Rings") { result in
    switch result {
    case .success(let books):
        for book in books {
            print("Title: \(book.title)")
            print("Author: \(book.authorName.joined(separator: ", "))")
            print("Year: \(book.firstPublishYear)")
            print("-----")
        }
    case .failure(let error):
        print("Error: \(error)")
    }
}

searchBooksByAuthor(authorQuery: "J. K. Rowling") { result in
    switch result {
    case .success(let authors):
        for author in authors {
            print("Author Name: \(author.name)")
            print("Birth Date: \(author.birthDate)")
            print("Top Work: \(author.topWork)")
            print("Work Count: \(author.workCount)")
            print("-----")
        }
    case .failure(let error):
        print("Error: \(error)")
    }
}
