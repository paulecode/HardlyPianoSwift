//
//  PrimaryButtonViewModifier.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import Foundation
import SwiftUI

struct PrimaryButtonColorViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.foregroundColor(.white)
			.font(.system(size: 20))
			.fontWeight(.medium)
			.background(Color("PrimaryButton"))
	}
}

extension View {
	func withPrimaryButtonColorModifier() -> some View {
		modifier(PrimaryButtonColorViewModifier())
	}
}
