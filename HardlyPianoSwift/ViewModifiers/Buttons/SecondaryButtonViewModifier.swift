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
			.frame(maxWidth: .infinity)
			.padding(.vertical, 12)
			.font(.system(size: 20))
			.fontWeight(.bold)
			.background(.white)
			.cornerRadius(0)
			.border(Color("PrimaryButton"), width: 1.5)			
	}
}

extension View {
	
	func withSecondaryButtonStyle() -> some View {
		modifier(SecondaryButtonViewModifier())
	}
}
