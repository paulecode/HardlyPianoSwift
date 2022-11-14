//
//  RerverseSlide.swift
//  HardlyPianoSwift
//
//  Created by Paul on 14.11.22.
//

import Foundation
import SwiftUI

extension AnyTransition {
	static var reverseSlide: AnyTransition {
		AnyTransition.asymmetric(
			insertion: .move(edge: .trailing),
			removal: .move(edge: .leading))}
}
