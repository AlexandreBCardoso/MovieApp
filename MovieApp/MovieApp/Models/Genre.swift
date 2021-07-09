//
//  Genre.swift
//  MovieApp
//
//  Created by Alexandre Cardoso on 05/07/21.
//

import Foundation

struct Genres: Decodable {
	let genres: [Genre]
}

struct Genre: Decodable {
	let id: Int
	let name: String
}
