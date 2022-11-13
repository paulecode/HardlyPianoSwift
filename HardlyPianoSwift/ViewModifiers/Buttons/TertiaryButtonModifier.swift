//
//  TertiaryButtonModifier.swift
//  HardlyPianoSwift
//
//  Created by Paul on 13.11.22.
//

import Foundation
import SwiftUI

struct TertiaryButtonViewModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.vertical, 12)
			.foregroundColor(Color("Flat2"))
			.font(.system(size: 18))
			.fontWeight(.bold)
			.background(.clear)
	}
}

extension View {
	
	func withTertiaryButtonStyle() -> some View {
		modifier(TertiaryButtonViewModifier())
	}
}
