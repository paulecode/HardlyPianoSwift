//
//  ContentView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var userSession: UserSession
    var body: some View {
		if userSession.isSignedIn {
			MainView(selectedView: .constant(7))
		} else {
			SignUpView()
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
