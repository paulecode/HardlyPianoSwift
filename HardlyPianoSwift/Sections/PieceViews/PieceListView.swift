//
//  PieceListView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceListView: View {
	
	@State var pieces: [Piece] = MockPieces().pieces
	var body: some View {
		List {
			ForEach(pieces) { piece in
				PieceListEntry(title: piece.title, composer: piece.composer, practice: piece.practiceTime)
					.listRowSeparatorTint(Color("Flat3"))
					.listRowBackground(Color("Flat9"))
			}
		}
		.listStyle(.plain)
		//TODO Fix this inset :(
		
	}
}

struct PieceListView_Previews: PreviewProvider {
	static var previews: some View {
		PieceListView()
	}
}
