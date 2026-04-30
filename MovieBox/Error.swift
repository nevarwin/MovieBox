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
