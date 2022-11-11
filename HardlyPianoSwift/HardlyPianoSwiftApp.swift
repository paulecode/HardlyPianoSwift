//
//  HardlyPianoSwiftApp.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import SwiftUI

@main
struct HardlyPianoSwiftApp: App {
//	@State var selectedView: Int = 9
    var body: some Scene {
        WindowGroup {
//            ContentView()
//			MainView(selectedView: $selectedView)
			AuthView(authenticator: MockAuthService(username: nil, password: nil), debug: true)
//			PieceListView()
        }
    }
}
