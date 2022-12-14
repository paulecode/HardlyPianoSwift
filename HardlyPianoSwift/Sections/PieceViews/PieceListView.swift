//
//  PieceListView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceListView: View {
	
	let background: Color
	let pieceService: pieceServiceProtocol
	
	@Binding var pieces: [Piece]
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
			ScrollView {
				ForEach(composers, id: \.self) { composer in
					VStack (alignment: .leading, spacing: 16){
						Text(composer)
							.font(.title)
						ForEach (pieces.filter({ Piece in
							Piece.composer == composer
						}), id: \.self) { piece in
//							NavigationLink {
//								PieceViewDetail(title: piece.title)
//							} label: {
//								PieceListEntry(title: piece.title, practice: piece.practiceTime)
//							}
//							.buttonStyle(PlainButtonStyle())
							PieceListEntry(piece: piece, pieceService: pieceService, pieces: $pieces)

						}
					}
					.padding()
				}
				
			}
			.background(background)
			
		}
		
	}
}

struct PieceListView_Previews: PreviewProvider {
	static var previews: some View {
		PieceListView(background: .white, pieceService: MockPieces(), pieces: .constant(MockPieces().pieces))
	}
}
