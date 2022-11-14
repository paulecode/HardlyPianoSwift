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
	
	var token: String
	
	init() {
		self.token = "InvalidToken"
	}
	
	func setToken(token: String) {
		self.token = token
	}
	
	func getAllPieces() async throws -> [Piece] {
		
//		print(UserSession().token ?? "No token")
		print("Token from get: " + token)
		if let token = UserSession().token {
		
			guard let localurl = URL(string: "http://localhost:3000/pieces") else {
				print("Invalid URL")
				throw RequestError.BadRequest
			}
			let authToken = token
			var request = URLRequest(url: localurl)
			request.httpMethod = "GET"
			request.setValue(authToken, forHTTPHeaderField: "Auth-Token")
			let response = try await URLSession.shared.data(for: request)
			let decoder = JSONDecoder()
			let decodedResponse = try decoder.decode([Piece].self, from: response.0)
			
			if let statusResponse = response.1 as? HTTPURLResponse {
				print(statusResponse.statusCode)
			}
			print(decodedResponse.description)
			
			return decodedResponse
		}
		throw RequestError.BadRequest
	}
	
	func postPiece(title: String, composer: String) async throws -> Piece {
		let pieceToPost = PostPiece(title: title, composer: composer)
	
		guard let localurl = URL(string: "http://localhost:3000/pieces") else {
			throw LoginError.invalidURL
		}
		
		var request = URLRequest(url: localurl)
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
					let decodedResponse = try decoder.decode(Piece.self, from: response.0)
					return decodedResponse
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
//	
//	func deletePiece(piece: Piece) async throws -> Bool {
//		<#code#>
//	}
//	
//	func updatePiece(oldPiece: Piece, title: String?, composer: String?) async throws -> Piece {
//		<#code#>
//	}
	
	
}
