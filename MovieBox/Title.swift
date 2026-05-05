//
//  Title.swift
//  MovieBox
//
//  Created by raven on 4/29/26.
//

import Foundation

struct APIObject: Decodable {
    var results: [Title] = []
}

struct Title: Decodable, Identifiable, Hashable {
    var id : Int?
    var title : String?
    var name : String?
    var overview : String?
    var posterPath : String?
    
    static var previewTitles = [
        Title(id: 1, title: "BeetleJuice", name: "BeetleJuice", overview: "A movie about beetlejuice", posterPath: Constants.titleTestURL),
        Title(id: 2, title: "Pulp fiction", name: "Pulp fiction", overview: "A movie about pulp fiction", posterPath: Constants.titleTestURL2),
        Title(id: 3, title: "Dark Knight", name: "Dark Knight", overview: "A movie about the dark knight", posterPath: Constants.titleTestURL3)
    ]
}
