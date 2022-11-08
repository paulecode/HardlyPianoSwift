//
//  SecondaryButtonViewModifier.swift
//  HardlyPianoSwift
//
//  Created by Paul on 07.11.22.
//

import Foundation
import SwiftUI

struct SecondaryButtonViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.foregroundColor(Color("PrimaryButton"))
			.font(.system(size: 20))
			.fontWeight(.bold)
			.background(.white)
			.border(Color("PrimaryButton"), width: 1.5)
	}
}

extension View {
	
	func withSecondaryButtonStyle() -> some View {
		modifier(SecondaryButtonViewModifier())
	}
}
