//
//  UserSession.swift
//  HardlyPianoSwift
//
//  Created by Paul on 11.11.22.
//

import Foundation

class UserSession: ObservableObject {
	@Published var isSignedIn: Bool
	init() {
		self.isSignedIn = false
	}
	func signIn() {
		self.isSignedIn = true
	}
	func signOut() {
		self.isSignedIn = false
	}
}
