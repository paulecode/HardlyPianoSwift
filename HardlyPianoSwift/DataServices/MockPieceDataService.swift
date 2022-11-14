//
//  MockPieceDataService.swift
//  HardlyPianoSwift
//
//  Created by Paul on 04.11.22.
//

import Foundation

protocol pieceServiceProtocol {
	
	func setToken(token: String)
	
	func getAllPieces() async throws -> [Piece]
	
	func postPiece(title: String, composer: String) async throws -> Piece
//
//	func deletePiece(piece: Piece) async throws -> Bool
//
//	func updatePiece(oldPiece: Piece, title: String?, composer: String?) async throws -> Piece
	
}

class MockPieces: ObservableObject, pieceServiceProtocol {
	
	var token: String
	
	init() {
		self.token = "validtoken"
	}
	@Published var pieces: [Piece] = [
	Piece(
		mongoID: "632b4856fa42ef9537d9b375",
		title: "Moonlight Sonata Mov. 1",
		composer: "Beethoven",
		practiceTime: 6
	),
	Piece(
		mongoID: "632b4860fa42ef9537d9b377",
		title: "Moonlight Sonata Mov. 2",
		composer: "Beethoven",
		practiceTime: 9
	),
	Piece(
		mongoID: "632b4868fa42ef9537d9b379",
		title: "Moonlight Sonata Mov. 3",
		composer: "Beethoven",
		practiceTime: 12
	),
	Piece(
		mongoID: "632b48b7fa42ef9537d9b385",
		title: "Lacrimosa",
		composer: "Mozart",
		practiceTime: 7
	),
	Piece(
		mongoID: "632b4910fa42ef9537d9b38b",
		title: "Nocturne Opus 9 Nr. 2",
		composer: "Chopin",
		practiceTime: 25
	),
	Piece(
		mongoID: "632b4917fa42ef9537d9b38d",
		title: "Nocturne Opus 9 Nr. 1",
		composer: "Chopin",
		practiceTime: 1
	),
	]
	
	func setToken(token: String) {
		self.token = token
	}
	
	func getAllPieces() async throws -> [Piece] {
		return pieces
	}
	
	func postPiece(title: String, composer: String) async throws -> Piece {
		let newPiece = Piece(mongoID: UUID().description, title: title, composer: composer, practiceTime: 0)
		pieces.append(newPiece)
		return newPiece
	}
	
	func deletePiece(piece: Piece) async throws -> Bool {
		pieces = pieces.filter({ $0 != piece})
		return true
	}
	
	func updatePiece(oldPiece: Piece, title: String?, composer: String?) async throws -> Piece {
		//Check what changed
		let newPiece = Piece(mongoID: oldPiece.mongoID, title: title ?? oldPiece.title, composer: composer ?? oldPiece.composer, practiceTime: oldPiece.practiceTime)
		return newPiece
	}
}
