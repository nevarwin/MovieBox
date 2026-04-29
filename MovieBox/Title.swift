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

struct Title: Decodable, Identifiable {
    var id : Int?
    var title : String?
    var name : String?
    var overview : String?
    var posterPath : String?
}
