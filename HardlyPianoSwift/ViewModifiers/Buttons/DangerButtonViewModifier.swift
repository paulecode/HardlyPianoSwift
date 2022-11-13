//
//  DangerButtonViewModifier.swift
//  HardlyPianoSwift
//
//  Created by Paul on 13.11.22.
//

import Foundation
import SwiftUI

struct DangerButtonColorViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.foregroundColor(.white)
			.font(.system(size: 20))
			.fontWeight(.medium)
			.background(Color("Fuoco5"))
	}
}

extension View {
	func withDangerButtonColorViewModifier() -> some View {
		modifier(DangerButtonColorViewModifier())
	}
}
