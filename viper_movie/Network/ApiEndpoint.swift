//
//  ApiEndpoint.swift
//  viper_movie
//
//  Created by UMUT on 7.11.2025.
//

import Foundation

enum ApiEndpoint{
    case getPopulerMovies
    
    var baseUrl: String {
        return "https://api.themoviedb.org/3"
    }
    
    var path: String {
        switch self {
        case .getPopulerMovies:
            return "/movie/popular"
        }
    }
    var networkMethod: NetworkMethod {
        switch self {
        case .getPopulerMovies:
            return .get
        }
    }
    
    var url : URL? {
        return URL(string: "\(baseUrl)\(path)?api_key=82dee22856e0d0ac5f767ec6fb845efc")
    }
}
