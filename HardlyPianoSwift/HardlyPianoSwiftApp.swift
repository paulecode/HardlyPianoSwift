//
//  HardlyPianoSwiftApp.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import SwiftUI

@main
struct HardlyPianoSwiftApp: App {
	@StateObject var userSession = UserSession()
	
	//Declare your authenticator here
	var authenticator: authenticatorProtocol = MockAuthService()
	//	var authenticator: authenticatorProtocol = RestAuthenticator()
	
	var body: some Scene {
		WindowGroup {
			ContentView(authenticator: authenticator)
				.environmentObject(userSession)
		}
	}
}
