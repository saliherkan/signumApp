//
//  File.swift
//  SignumApp
//
//  Created by Salih Erkan Sandal on 3.02.2021.
//

import Foundation


// MARK: - AramaResponse
struct AramaResponseModel: Codable {
    let search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable {
    let title, year, imdbid, type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbid = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
