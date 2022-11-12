//
//  PieceListView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceListView: View {
	
	@State var pieces: [Piece] = MockPieces().pieces
	//	@State var pathView: Piece
	
	//	var sortedPieces
	
	//	var composers: Set {
	//		return Set(pieces.map({ $0.composer })).sorted()
	//	}
	//	func composers() -> Set<String> {
	//		return Set(pieces.map({ $0.composer }).sorted())
	//	}
	var composers: Array<String> {
		return Set(pieces.map({ $0.composer })).sorted()
	}
	
	var body: some View {
		NavigationStack {
			List {
				ForEach(composers, id: \.self) { composer in
					VStack (alignment: .leading, spacing: 16){
						Text(composer)
							.font(.title)
							.listRowBackground(Color.clear)
						ForEach (pieces.filter({ Piece in
							Piece.composer == composer
						}), id: \.self) { piece in
							//							PieceListEntry(title: piece.title, practice: piece.practiceTime)
							//								.listRowBackground(Color.clear)
							//								.listRowSeparator(.hidden)
							
							NavigationLink(value: piece) {
								Text(piece.title)
							}
						}
						
					}
					.listRowBackground(Color.clear)
					.listRowSeparator(.hidden)
				}
				
			}
			.navigationDestination(for: Piece.self) { piece in
				Text("You made it")
			}
			.listStyle(.plain)
		}

		//TODO Fix this inset :(
		
	}
}

struct PieceListView_Previews: PreviewProvider {
	static var previews: some View {
		PieceListView()
	}
}
