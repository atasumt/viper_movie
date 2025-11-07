//
//  ApiError.swift
//  viper_movie
//
//  Created by UMUT on 7.11.2025.
//

import Foundation

enum ApiError: Error {
    case noData
    case invalidData
    case custom(Error)
    
    var localizedDescription: String {
        switch self {
        case .noData:
            return "No data"
        case .invalidData:
            return "Invalid data"
        case .custom(let error):
            return error.localizedDescription
        }
    }
}
