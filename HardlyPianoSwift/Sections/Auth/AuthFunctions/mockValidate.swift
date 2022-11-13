//
//  mockValidate.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import Foundation

class MockAuthService: authenticatorProtocol {
	
	func signIn(username: String, password: String) throws -> String {
		if (username == "irakli" && password == "123456") {
			return "JWT1337"
		} else {
			throw LoginError.badRequest(message: "Bad Requests")
		}
	}
	
	func signUp(username: String, password: String) throws -> Bool {
		if (username == "irakli") { return true } else { return false }
	}
	
}
