//
//  PrimaryButtonSizeViewModifier.swift
//  HardlyPianoSwift
//
//  Created by Paul on 08.11.22.
//

import Foundation
import SwiftUI

struct PrimaryButtonSizeViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(maxWidth: .infinity)
			.padding(.vertical, 12)
			.cornerRadius(0)
	}
}

extension View {
	func withPrimaryButtonSizeViewModifier() -> some View {
		modifier(PrimaryButtonSizeViewModifier())
	}
}
