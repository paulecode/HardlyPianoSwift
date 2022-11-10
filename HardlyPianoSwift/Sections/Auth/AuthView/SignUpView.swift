//
//  SignUpView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 10.11.22.
//

import SwiftUI

struct SignUpView: View {
	
	@State private var username: String = ""
	@State private var password: String = ""
	@State private var repeatpassword: String = ""
	@FocusState private var userfieldFocused: Bool
	@FocusState private var passfieldFocused: Bool
	@FocusState private var repeatPassFocused: Bool
	
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
			
			//RepeatPassTextfield
			VStack (alignment: .leading) {
				Text("repeat password")
					.fontWeight(.bold)
				SecureField("*********", text: $repeatpassword)
					.focused($repeatPassFocused)
				Divider()
					.frame(height: 1)
					.background(repeatPassFocused ? .black : .gray)
			}
			.padding()
			
			//LoginButton
			Button {

			} label: {
				Text("sign up")
					.withPrimaryButtonSizeViewModifier()
					.withPrimaryButtonColorModifier()
					.padding(.horizontal, 16)
				
				
			}
			
			Divider()
				.frame(maxWidth: .infinity, maxHeight: 1)
				.background(.black)
				.padding(16)
			
			//To Register CTA
			Text("already have an account?")
				.fontWeight(.bold)
			
			Button {
				//Add functionality please :(
			} label: {
				Text("sign in")
					.withPrimaryButtonSizeViewModifier()
					.withSecondaryButtonStyle()
					.padding(.horizontal, 16)
				
			}
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("Flat9"))
	}
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
