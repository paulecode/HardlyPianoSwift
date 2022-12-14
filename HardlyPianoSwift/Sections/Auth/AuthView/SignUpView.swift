//
//  SignUpView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 10.11.22.
//

import SwiftUI

struct SignUpView: View {
	
	@EnvironmentObject var userSession: UserSession
	
	var authenticator: authenticatorProtocol
	
	@State private var username: String = ""
	@State private var password: String = ""
	@State private var repeatpassword: String = ""
	
	@Binding var hasAccount: Bool
	
	@FocusState private var userfieldFocused: Bool
	@FocusState private var passfieldFocused: Bool
	@FocusState private var repeatPassFocused: Bool
	
	var body: some View {
		VStack {
			
			//LoginTextField
			VStack (alignment: .leading, spacing: 0) {
				Text("username")
					.fontWeight(.bold)
				TextField("Maurice Ravel", text: $username)
					.focused($userfieldFocused)
					.autocorrectionDisabled(true)
					.textInputAutocapitalization(.never)
					.padding(.vertical, 12)
				Divider()
					.frame(height: 1)
					.background(userfieldFocused ? Color("Flat3") : Color("Flat7"))
			}
			.padding()
			
			//PassTextfield
			VStack (alignment: .leading, spacing: 0) {
				Text("password")
					.fontWeight(.bold)
				SecureField("*********", text: $password)
					.focused($passfieldFocused)
					.padding(.vertical, 12)
				Divider()
					.frame(height: 1)
					.background(passfieldFocused ? Color("Flat3") : Color("Flat7"))
			}
			.padding()
			
			//RepeatPassTextfield
			VStack (alignment: .leading, spacing: 0) {
				Text("repeat password")
					.fontWeight(.bold)
				SecureField("*********", text: $repeatpassword)
					.focused($repeatPassFocused)
					.padding(.vertical, 12)
				Divider()
					.frame(height: 1)
					.background(repeatPassFocused ? Color("Flat3") : Color("Flat7"))
			}
			.padding()
			//LoginButton
			Button {
				Task {
					if (password == repeatpassword) {
						//attempt sign up
						do {
							if try await authenticator.signUp(username: username, password: password) {
								//attempt sign in
								let token: String = try await authenticator.signIn(username: username, password: password)
								userSession.signIn(token: token)
							}
						} catch {
							
						}
					} else {
						//catch error
					}
				}
			} label: {
				Text("sign up")
					.withPrimaryButtonSizeViewModifier()
					.withPrimaryButtonColorModifier()
					.padding(.horizontal, 16)
			}
			
			Divider()
				.frame(maxWidth: .infinity, maxHeight: 1)
				.background(Color("Flat3"))
				.padding(16)
			
			//To Register CTA
			Text("already have an account?")
				.fontWeight(.bold)
			
			Button {
				withAnimation {
					hasAccount.toggle()
				}				
			} label: {
				Text("sign in")
					.withPrimaryButtonSizeViewModifier()
					.withSecondaryButtonStyle()
					.padding(.horizontal, 16)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("Flat9"))
		.transition(.slide)
	}
}

struct SignUpView_Previews: PreviewProvider {
	static var previews: some View {
		let mockAuth: authenticatorProtocol = MockAuthService()
		SignUpView(authenticator: mockAuth, hasAccount: .constant(false))
	}
}
