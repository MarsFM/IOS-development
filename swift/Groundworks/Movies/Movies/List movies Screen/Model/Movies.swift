//
//  Result.swift
//  Movies
//
//  Created by ilya on 15.03.2019.
//  Copyright © 2019 ilya. All rights reserved.
//

import Foundation

struct Result: Codable {
    let page, totalResults, totalPages: Int
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}

struct Movie: Codable {
    let voteCount: Int?
    let id: Int?
    let video: Bool?
    let voteAverage: Double?
    let title: String?
    let popularity: Double?
    let posterPath: String?
    let originalLanguage: OriginalLanguage? = nil
    let originalTitle: String?
    let genreIDS: [Int]?
    let backdropPath: String?
    let adult: Bool?
    let overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Codable {
    case cn = "cn"
    case en = "en"
    case nl = "nl"
    case ru = "ru"
    case ja = "ja"
    case zh = "zh"
    case de = "de"
    case fr = "fr"
    case pl = "pl"
}
