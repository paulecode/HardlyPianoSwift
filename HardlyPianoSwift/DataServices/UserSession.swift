//
//  UserSession.swift
//  HardlyPianoSwift
//
//  Created by Paul on 11.11.22.
//

import Foundation

class UserSession: ObservableObject {
	@Published var isSignedIn: Bool
	var token: String?
	var username: String?
	
	init() {
		self.isSignedIn = false
		self.token = nil
		self.username = nil
	}
	
	func signIn(token: String) { //<--- add `username: String` if we have it on the backend
		self.isSignedIn = true
//		self.username = username
		self.token = token
	}
	
	func signOut() {
		self.isSignedIn = false
		self.username = nil
		self.token = nil
	}
}
