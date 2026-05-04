//
//  APIConfig.swift
//  MovieBox
//
//  Created by raven on 4/30/26.
//

import Foundation

struct APIConfig: Decodable {
    let tmdbBaseURL: String
    let tmdbAPIKey: String
    
    static let shared: APIConfig? = {
        do {
            return try loadConfig()
        } catch {
            print("Failed to load API Config: \(error.localizedDescription)")
            return nil
        }
    }()
    
    private static func loadConfig() throws -> APIConfig {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: "json") else {
            throw APIConfigError.fileNotFound
        }
        
        let data: Data
        do {
            data = try Data(contentsOf: url)
        } catch {
            throw APIConfigError.dataLoadingFailed(underlyingError: error)
        }
        
        do {
            return try JSONDecoder().decode(APIConfig.self, from: data)
        } catch {
            throw APIConfigError.decodingFailed(underlyingError: error)
        }
    }
}
