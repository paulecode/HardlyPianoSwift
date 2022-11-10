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
	@FocusState private var userfieldFocused: Bool
	@FocusState private var passfieldFocused: Bool
	@State private var isSignedIn: Bool = false
	
	var authenticator: validationProtocol
	
	//Feature flags
	let debug: Bool
	
	var body: some View {
		VStack {
			
			//LoginTextField
			VStack (alignment: .leading) {
				Text("username")
					.fontWeight(.bold)
				TextField("Maurice Ravel", text: $username)
					.focused($userfieldFocused)
					.autocorrectionDisabled(true)
					.textInputAutocapitalization(.never)
				Divider()
					.frame(height: 1)
					.background(userfieldFocused ? .black : .gray)
			}
			.padding()
			
			//PassTextfield
			VStack (alignment: .leading) {
				Text("password")
					.fontWeight(.bold)
				SecureField("*********", text: $password)
					.focused($passfieldFocused)
				Divider()
					.frame(height: 1)
					.background(passfieldFocused ? .black : .gray)
			}
			.padding()
			
			//LoginButton
			Button {
				if authenticator.signIn(usernameInput: username, passwordInput: password) {
					isSignedIn = true
				}
			} label: {
				Text("Login")
					.withPrimaryButtonSizeViewModifier()
					.withPrimaryButtonColorModifier()
					.padding(.horizontal, 16)
				
				
			}
			
			Divider()
				.frame(maxWidth: .infinity, maxHeight: 1)
				.background(.black)
				.padding(16)
			
			//To Register CTA
			Text("Don't have an account yet?")
				.fontWeight(.bold)
			
			Button {
				//Add functionality please :(
			} label: {
				Text("Create an Account")
					.withPrimaryButtonSizeViewModifier()
					.withSecondaryButtonStyle()
					.padding(.horizontal, 16)
				
			}
			
			if debug {
				Text("Valid login: " + isSignedIn.description)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("Flat9"))
	}
}

struct AuthView_Previews: PreviewProvider {
	
	
	static var previews: some View {
		let mockAuth = MockAuthService(username: nil, password: nil)
		AuthView(authenticator: mockAuth, debug: false)
	}
}
