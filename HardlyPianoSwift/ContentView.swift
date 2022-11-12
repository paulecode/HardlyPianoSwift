//
//  ContentView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import SwiftUI

struct ContentView: View {
	@State var selectedView: Int = 7
	@EnvironmentObject var userSession: UserSession
	var authenticator: authenticatorProtocol
    var body: some View {
		if userSession.isSignedIn {
			MainView(selectedView: $selectedView)
		} else {
			AuthView(authenticator: authenticator, debug: true)
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authenticator: MockAuthService())
    }
}
