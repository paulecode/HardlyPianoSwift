//
//  mockValidate.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import Foundation

class MockAuthService: validationProtocol {
	
	let username: String //= "James"
	let password: String //= "Bond"
	
	init(username: String?, password: String?) {
		self.username = username ?? "James"
		self.password = password ?? "Bond"
	}
	
	func signIn(usernameInput: String, passwordInput: String) -> Bool {
		if (usernameInput == username && passwordInput == password) {
			return true
		} else {
			return false
		}
	}
	
}
