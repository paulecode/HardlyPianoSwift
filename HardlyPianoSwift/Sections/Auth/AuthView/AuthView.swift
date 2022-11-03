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
			
			VStack(alignment: .leading, spacing: 0) {
				Text("Username")
					.font(.subheadline)
//					.border(.orange)
				TextField("Username", text: $username)
					.padding(.top, 12)
					.padding(.bottom, 4)
					.font(.system(size: 20))
//					.border(.orange)
				Rectangle()
					.frame(height: 1)
			}
			
			VStack(alignment: .leading, spacing: 0) {
				Text("Password")
//					.border(.orange)
				TextField("Password", text: $password)
					.padding(.top, 12)
					.padding(.bottom, 4)
					.font(.system(size: 20))
					.border(.orange)
				Rectangle()
					.frame(height: 1)
			}
			
			Button {
				if authenticator.signIn(usernameInput: username, passwordInput: password) {
					isSignedIn = true
				}
			} label: {
					Text("Test")
					.withPrimaryButtonStyle()
					
			}
//			.buttonStyle(.borderedProminent)
			
//			.frame(maxWidth: .infinity)
			
			
			Rectangle()
				.frame(height: 1)
				
			
			Text("Don't have an account yet?")
			
			Button {
				
			} label: {
				Text("Create an Account")
					.frame(maxWidth: .infinity)
					.padding(.vertical, 12)
					.font(.system(size: 20))
					.fontWeight(.bold)
			}
			.buttonStyle(.bordered)

			if debug {
				Text("Valid login: " + isSignedIn.description)
			}
		}
		.padding(.horizontal, 24.0)
    }
}

struct AuthView_Previews: PreviewProvider {
	
	
    static var previews: some View {
	//look at that beautiful dependency injection
	let mockAuth = MockAuthService(username: nil, password: nil)
		AuthView(authenticator: mockAuth, debug: true)
    }
}
