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
	@State private var failedSignIn: Bool = false
	
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
					.onSubmit {
						Task {
							await signIn()
						}
					}
				Divider()
					.frame(height: 1)
					.background(passfieldFocused ? Color("Flat3") : Color("Flat7"))
			}
			.padding()
			
			//LoginButton
			Button {
				Task {
					await signIn()
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
				withAnimation {
					hasAccount.toggle()
				}
			} label: {
				Text("Create an Account")
					.withPrimaryButtonSizeViewModifier()
					.withSecondaryButtonStyle()
					.padding(.horizontal, 16)
				
			}
			
			if failedSignIn {
				Text("Check your credentials")
					.foregroundColor(Color("Fuoco5"))
					.transition(.slide)
			}
			
			if debug {
				Text("Valid login: " + isSignedIn.description)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("Flat9"))
		.transition(.slide)
	}
	
	func signIn() async {
			do {
				let token = try await authenticator.signIn(username: username, password: password)
				userSession.signIn(token: token)
			} catch LoginError.invalidLogin {
				print("dsa")
				withAnimation {
					failedSignIn = true
					username = ""
					password = ""
				}
			} catch {
				print(error)
			}
	}
}

struct AuthView_Previews: PreviewProvider {
	
	
	static var previews: some View {
//		let restAuth: authenticatorProtocol = RestAuthenticator()
		let mockAuth: authenticatorProtocol = MockAuthService()
		AuthView(hasAccount: .constant(true), authenticator: mockAuth, debug: false)
	}
}
