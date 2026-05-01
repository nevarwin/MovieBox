//
//  Error.swift
//  MovieBox
//
//  Created by raven on 4/30/26.
//

import Foundation

enum APIConfigError: Error, LocalizedError {
    case fileNotFound
    case dataLoadingFailed(underlyingError: Error)
    case decodingFailed(underlyingError: Error)
    
    var errorDescription: String? {
        switch self {
            case .fileNotFound:
                return "API config file not found."
            case .dataLoadingFailed(underlyingError: let error):
                return "Failed to load data. Error: \(error.localizedDescription)"
            case .decodingFailed(underlyingError: let error):
                return "Failed to decode data. Error: \(error.localizedDescription)"
        }
    }
}

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case badURLResponse(underlyingError: Error)
    case missingConfig
    case urlBuildFailed
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .badURLResponse(underlyingError: let error):
            return "Failed to parse URL response: \(error.localizedDescription)"
        case .missingConfig:
            return "Missing API configuration."
        case .urlBuildFailed:
            return "Failed to build URL."
        }
    }
}
