//
//  Piece.swift
//  HardlyPianoSwift
//
//  Created by Paul on 04.11.22.
//

import Foundation

struct Piece: Identifiable, Hashable, Decodable {
	
	let mongoID: String
	let id = UUID()
	var title: String
	var composer: String
	var practiceTime: Int = 0
	
	enum CodingKeys: String, CodingKey {
		case mongoID = "_id"
		case title = "title"
		case composer = "composer"
	}
}

struct PostPiece: Encodable {
	let title: String
	let composer: String
}

struct GetPieces: Decodable {
	let pieces: [Piece]
	
	enum CodingKeys: String, CodingKey {
		case pieces = "data"
	}
}

struct GetPiece: Decodable {
	let piece: Piece
	
	enum CodingKeys: String, CodingKey {
		case piece = "data"
	}
}
