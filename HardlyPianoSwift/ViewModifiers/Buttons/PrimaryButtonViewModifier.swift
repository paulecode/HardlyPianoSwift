//
//  PrimaryButtonViewModifier.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import Foundation
import SwiftUI

struct PrimaryButtonViewModifier: ViewModifier {
	
	func body(content: Content) -> some View {
		content
			.foregroundColor(.white)
			.frame(maxWidth: .infinity)
			.padding(.vertical, 12)
			.font(.system(size: 20))
			.fontWeight(.medium)
			.background(Color("PrimaryButton"))
			.cornerRadius(0)
	}
}

extension View {
	
	func withPrimaryButtonStyle() -> some View {
		modifier(PrimaryButtonViewModifier())
	}
}
