//
//  ViewModel.swift
//  MovieBox
//
//  Created by raven on 5/1/26.
//

import Foundation

@Observable
class ViewModel {
    enum FetchStatus {
        case notStarted
        case fetching
        case success
        case failed(underlyingError: Error)
    }
    
    private(set) var homeStatus: FetchStatus = .notStarted
    private let dataFetcher = DataFetcher()
    var trendingMovies: [Title] = []
    var trendingTVShows: [Title] = []
    var topRatedMovies: [Title] = []
    var topRatedTVShows: [Title] = []
    var heroTitle = Title.previewTitles[0]
    
    func getTitles() async {
        if trendingMovies.isEmpty {
            do {
                async let tMovies = dataFetcher.fetchTitles(for: "movie", type: "trending")
                async let tTV = dataFetcher.fetchTitles(for: "tv", type: "trending")
                async let tRMovies = dataFetcher.fetchTitles(for: "movie", type: "top_rated")
                async let tRTV = dataFetcher.fetchTitles(for: "tv", type: "top_rated")
                
                trendingMovies = try await tMovies
                trendingTVShows = try await tTV
                topRatedMovies = try await tRMovies
                topRatedTVShows = try await tRTV
                
                if let title = trendingMovies.randomElement() {
                    heroTitle = title
                }
                
                homeStatus = .success
            } catch {
                print(error)
                homeStatus = .failed(underlyingError: error)
            } 
        } else {
            homeStatus = .success
        }
    }
}
