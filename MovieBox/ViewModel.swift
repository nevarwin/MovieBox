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
    
    func getTitles() async {
        
        do {
            trendingMovies = try await dataFetcher.fetchTitles(for: "movie", type: "trending")
            trendingTVShows = try await dataFetcher.fetchTitles(for: "tv", type: "trending")
            topRatedMovies = try await dataFetcher.fetchTitles(for: "movie", type: "top_rated")
            topRatedTVShows = try await dataFetcher.fetchTitles(for: "tv", type: "top_rated")
            homeStatus = .success
        } catch {
            print(error)
            homeStatus = .failed(underlyingError: error)
        }
    }
}
