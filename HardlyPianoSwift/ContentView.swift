//
//  ContentView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import SwiftUI

struct ContentView: View {
	
	@State var selectedView: Int = 7
	@State var hasAccount: Bool = true
	
	@EnvironmentObject var userSession: UserSession
	
	var pieceService: pieceServiceProtocol
	var authenticator: authenticatorProtocol
	
	var body: some View {
		if userSession.isSignedIn {
			MainView(selectedView: $selectedView, pieceService: pieceService)
		} else {
			if hasAccount {
				AuthView(hasAccount: $hasAccount, authenticator: authenticator, debug: true)
			} else {
				SignUpView(authenticator: authenticator, hasAccount: $hasAccount)
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {

	static var userSession: UserSession = UserSession()
		
	static var previews: some View {
		ContentView(pieceService: MockPieces(), authenticator: MockAuthService())
			.environmentObject(userSession)
	}
}
