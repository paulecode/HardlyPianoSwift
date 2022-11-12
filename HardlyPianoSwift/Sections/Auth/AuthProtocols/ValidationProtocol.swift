//
//  ValidationProtocol.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import Foundation

protocol validationProtocol {
	var username: String {get}
	var password: String {get}
	
	func signIn(usernameInput: String, passwordInput: String) -> Bool
}

protocol authenticatorProtocol {
	func signIn(username: String, password: String) async throws -> String
}
