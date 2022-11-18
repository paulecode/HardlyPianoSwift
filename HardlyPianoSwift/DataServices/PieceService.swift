//
//  PieceService.swift
//  HardlyPianoSwift
//
//  Created by Paul on 14.11.22.
//

import Foundation

enum RequestError: Error {
	case BadRequest
}

class RestPieceService: pieceServiceProtocol {

	var urlString = "http://ec2-3-66-192-132.eu-central-1.compute.amazonaws.com:3000"
	
	var token: String
	
	init() {
		self.token = "InvalidToken"
	}
	
	func setToken(token: String) {
		self.token = token
	}
	
	func getAllPieces() async throws -> [Piece] {
		
		guard let localurl = URL(string: urlString + "/pieces") else {
			print("Invalid URL")
			throw RequestError.BadRequest
		}
		
		var request = URLRequest(url: localurl)
		request.httpMethod = "GET"
		request.setValue(token, forHTTPHeaderField: "Auth-Token")
		let response = try await URLSession.shared.data(for: request)
		let decoder = JSONDecoder()
		let decodedResponse = try decoder.decode(GetPieces.self, from: response.0)
		
		if let statusResponse = response.1 as? HTTPURLResponse {
			print(statusResponse.statusCode)
		} else {
			throw RequestError.BadRequest
		}
		print(decodedResponse.pieces.description)
		
		return decodedResponse.pieces
	}
	
	func postPiece(title: String, composer: String) async throws -> Piece {
		let pieceToPost = PostPiece(title: title, composer: composer)
		
		guard let localurl = URL(string: urlString + "/pieces") else {
			throw LoginError.invalidURL
		}
		
		var request = URLRequest(url: localurl)
		
		request.setValue(token, forHTTPHeaderField: "Auth-Token")
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let encoder = JSONEncoder()
		let decoder = JSONDecoder()
		
		do {
			let encodedData = try encoder.encode(pieceToPost)
			request.httpBody = encodedData
			let response = try await URLSession.shared.upload(for: request, from: encodedData) //reponse is a set of (Data, URLResponse)
			//TODO throw if not working
			
			if let statusResponse = response.1 as? HTTPURLResponse {
				if (statusResponse.statusCode == 200) {
					let decodedResponse = try decoder.decode(GetPiece.self, from: response.0)
					return decodedResponse.piece
				} else if (statusResponse.statusCode == 400) {
					print("Posting failed")
					throw RequestError.BadRequest
					//Specify please
				} else {
					let errorResponse = try decoder.decode(ErrorResponse.self, from: response.0)
					throw LoginError.badRequest(message: errorResponse.message)
				}
			}
		} catch {
			throw LoginError.encodingFailed
		}
		throw LoginError.serverOffline
		
	}
	
	func deletePiece(piece: Piece) async throws -> Bool {
		
		
		
		guard let localurl = URL(string: urlString + "/pieces/" + piece.mongoID) else {
			print("Invalid URL")
			throw RequestError.BadRequest
		}
		
		var request = URLRequest(url: localurl)
		request.httpMethod = "DELETE"
		request.setValue(token, forHTTPHeaderField: "Auth-Token")
		let response = try await URLSession.shared.data(for: request)
		
		if let statusResponse = response.1 as? HTTPURLResponse {
			if (statusResponse.statusCode == 200) {
				return true
			} else {
				return false
			}
		} else {
			throw RequestError.BadRequest
			//TODO Fix specify error
		}
	}
	
	func updatePiece(oldPiece: Piece, title: String, composer: String) async throws -> Piece {
		let pieceToPost = PostPiece(title: title, composer: composer)
		
		guard let localurl = URL(string: urlString + "/pieces/" + oldPiece.mongoID) else {
			throw LoginError.invalidURL
		}
		
		var request = URLRequest(url: localurl)
		
		request.setValue(token, forHTTPHeaderField: "Auth-Token")
		request.httpMethod = "PATCH"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		let encoder = JSONEncoder()
		let decoder = JSONDecoder()
		
		do {
			let encodedData = try encoder.encode(pieceToPost)
			request.httpBody = encodedData
			let response = try await URLSession.shared.upload(for: request, from: encodedData) //reponse is a set of (Data, URLResponse)
			//TODO throw if not working
			
			if let statusResponse = response.1 as? HTTPURLResponse {
				if (statusResponse.statusCode == 200) {
					let decodedResponse = try decoder.decode(GetPiece.self, from: response.0)
					return decodedResponse.piece
				} else if (statusResponse.statusCode == 400) {
					print("Posting failed")
					throw RequestError.BadRequest
					//Specify please
				} else {
					let errorResponse = try decoder.decode(ErrorResponse.self, from: response.0)
					throw LoginError.badRequest(message: errorResponse.message)
				}
			}
		} catch {
			throw LoginError.encodingFailed
		}
		throw LoginError.serverOffline
	}
}
