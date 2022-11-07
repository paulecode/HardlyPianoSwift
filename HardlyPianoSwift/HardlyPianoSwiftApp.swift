//
//  HardlyPianoSwiftApp.swift
//  HardlyPianoSwift
//
//  Created by Paul on 27.10.22.
//

import SwiftUI

@main
struct HardlyPianoSwiftApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
			AuthView(authenticator: MockAuthService(username: nil, password: nil), debug: true)
        }
    }
}
