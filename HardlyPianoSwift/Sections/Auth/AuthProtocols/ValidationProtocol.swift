//
//  ValidationProtocol.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import Foundation

protocol authenticatorProtocol {
	func signIn(username: String, password: String) async throws -> String
}
