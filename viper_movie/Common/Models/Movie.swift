//
//  Movie.swift
//  viper_movie
//
//  Created by UMUT on 7.11.2025.
//
import Foundation

struct Movie: Codable,Sendable {
    let page: Int?
    let results: [Res]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
