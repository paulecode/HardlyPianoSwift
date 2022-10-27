//
//  AuthView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import SwiftUI

struct AuthView: View {
	
	@State private var username: String = ""
	@State private var password: String = ""
	@State private var isSignedIn: Bool = false
	
	var authenticator: validationProtocol
	
	//Feature flags
	let debug: Bool
	
    var body: some View {
		VStack {
			
			VStack(alignment: .leading) {
				Text("Username")
				TextField("Username", text: $username)
			}
			
			VStack(alignment: .leading) {
				Text("Password")
				TextField("Password", text: $password)
			}
			
			Button {
				if authenticator.signIn(usernameInput: username, passwordInput: password) {
					isSignedIn = true
				}
			} label: {
				Label("Sign in", systemImage: "arrow.forward")
			}
			.buttonStyle(.borderedProminent)
			
			Rectangle()
				.frame(height: 1)
			
			Text("Don't have an account yet?")
			
			Button {
				
			} label: {
				Text("Create an Account")
			}
			.buttonStyle(.bordered)

			if debug {
				Text("Valid login: " + isSignedIn.description)
			}
		}
    }
}

struct AuthView_Previews: PreviewProvider {
	
	
    static var previews: some View {
	//look at that beautiful dependency injection
	let mockAuth = MockAuthService(username: nil, password: nil)
		AuthView(authenticator: mockAuth, debug: true)
    }
}
