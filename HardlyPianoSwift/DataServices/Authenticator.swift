//
//  Authenticator.swift
//  HardlyPianoSwift
//
//  Created by Paul on 12.11.22.
//

import Foundation

enum LoginError: Error {
	
	case invalidURL
	case serverOffline
	case encodingFailed
	case badRequest(message: String)
	
}

struct UserCreds: Encodable {
	var username: String
	var password: String
}

struct LoginResponse: Decodable {
	var token: String
}

struct ErrorResponse: Decodable {
	var message: String
}

//class RestAuthenticator: authenticatorProtocol {
//	func signIn(username: String, password: String) async throws -> String {
//
//		let user: UserCreds = UserCreds(username: username, password: password)
//
//		guard let localurl = URL(string: "http://localhost:3000/auth/login") else {
//			throw LoginError.invalidURL
//		}
//
//		var request = URLRequest(url: localurl)
//		request.httpMethod = "POST"
//		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//		let encoder = JSONEncoder()
//		let decoder = JSONDecoder()
//
//		do {
//			let encodedData = try encoder.encode(user)
//			request.httpBody = encodedData
//			let response = try await URLSession.shared.upload(for: request, from: encodedData) //reponse is a set of (Data, URLResponse)
//			//TODO throw if not working
//
//			if let statusResponse = response.1 as? HTTPURLResponse {
//				if (statusResponse.statusCode == 200) {
//					let decodedResponse = try decoder.decode(LoginResponse.self, from: response.0)
//					print("Token: " + decodedResponse.token)
//					return decodedResponse.token
//				} else {
//					let errorResponse = try decoder.decode(ErrorResponse.self, from: response.0)
//					throw LoginError.badRequest(message: errorResponse.message)
//				}
//			}
//		} catch {
//			throw LoginError.encodingFailed
//		}
//		throw LoginError.serverOffline
//	}
//}
