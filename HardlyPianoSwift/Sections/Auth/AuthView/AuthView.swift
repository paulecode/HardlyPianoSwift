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
	
	@FocusState private var userfieldFocused: Bool
	@FocusState private var passfieldFocused: Bool
	
	@Binding var hasAccount: Bool
	
	@EnvironmentObject var userSession: UserSession
	
	var authenticator: authenticatorProtocol
	
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
					.background(userfieldFocused ? Color("Flat3") : Color("Flat7"))
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
					.background(passfieldFocused ? Color("Flat3") : Color("Flat7"))
			}
			.padding()
			
			//LoginButton
			Button {
				Task {
					do {
						let token = try await authenticator.signIn(username: username, password: password)
						userSession.signIn(token: token)
					} catch LoginError.badRequest(let message){
						print(message)
					} catch {
						print(error)
					}
				}
			} label: {
				Text("Login")
					.withPrimaryButtonSizeViewModifier()
					.withPrimaryButtonColorModifier()
					.padding(.horizontal, 16)
			}
			
			Divider()
				.frame(maxWidth: .infinity, maxHeight: 1)
				.background(Color("Flat3"))
				.padding(16)
			
			//To Register CTA
			Text("Don't have an account yet?")
				.fontWeight(.bold)
			
			Button {
				hasAccount.toggle()
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
//		let restAuth: authenticatorProtocol = RestAuthenticator()
		let mockAuth: authenticatorProtocol = MockAuthService()
		AuthView(hasAccount: .constant(true), authenticator: mockAuth, debug: false)
	}
}
