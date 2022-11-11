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
			ForEach(Set(pieces.map({ $0.composer })).sorted(), id: \.self) { composer in
				VStack (alignment: .leading, spacing: 16){
					Text(composer)
						.font(.title)
						.listRowBackground(Color.clear)
					ForEach(pieces.filter({ Piece in
						Piece.composer == composer
					})) { piece in
						PieceListEntry(title: piece.title, practice: piece.practiceTime)
							.listRowBackground(Color.clear)
							.listRowSeparator(.hidden)
					}
				}
				.listRowBackground(Color.clear)
				.listRowSeparator(.hidden)
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
