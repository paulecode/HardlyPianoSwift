//
//  Piece.swift
//  HardlyPianoSwift
//
//  Created by Paul on 04.11.22.
//

import Foundation

struct Piece: Identifiable {
	let mongoID: String
	let id = UUID()
	let title: String
	let composer: String
	let practiceTime: Int
}
