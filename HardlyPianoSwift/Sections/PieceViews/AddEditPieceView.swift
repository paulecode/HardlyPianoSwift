//
//  AddEditPieceView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 10.11.22.
//

import SwiftUI

struct AddEditPieceView: View {
	
	@Environment(\.dismiss) var dismiss
	@State var title: String = ""
	@State var composer: String = ""
	@State var isLoading: Bool = false
	@State var doneLoading: Bool = false
	
	@FocusState private var titleIsFocussed: Bool
	@FocusState private var composerIsFocussed: Bool
	
	
	var pieceService: pieceServiceProtocol
	
	//TODO Make Textfields mandatory.
	
	var body: some View {
		VStack {
			if doneLoading {
				Image(systemName: "checkmark.circle.fill")
					.background(.clear)
					.foregroundColor(Color("Nocturne3"))
					.font(.system(size: 60))
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.transition(.slide)
			} else {
				VStack {
					HStack {
						Text("Add or Edit Piece")
							.font(.title)
						Spacer()
						Button {
							//Cancel
							dismiss.callAsFunction()
						} label: {
							Image(systemName: "x.circle.fill")
								.foregroundColor(Color("Nocturne3"))
								.bold(true)
								.imageScale(.large)
								.padding(.vertical, 8)
						}
						
					}
					.padding()
					VStack (alignment: .leading, spacing: 0) {
						Text("Piece name")
							.fontWeight(.bold)
						TextField("Nocturne Op. 48 No. 1", text: $title)
							.focused($titleIsFocussed)
							.padding(.vertical, 12)
						Divider()
							.frame(height: 1)
							.background(titleIsFocussed ? .black : .gray)
					}
					.padding()
					
					VStack (alignment: .leading, spacing: 0) {
						Text("Composer")
							.fontWeight(.bold)
						TextField("Chopin", text: $composer)
							.focused($composerIsFocussed)
							.padding(.vertical, 12)
						Divider()
							.frame(height: 1)
							.background(composerIsFocussed ? .black : .gray)
					}
					.padding()
					Button {
						//Add Piece
						if !composer.isEmpty && !title.isEmpty {
							Task {
								isLoading = true
								titleIsFocussed = false
								composerIsFocussed = false
								do {
									_ = try await pieceService.postPiece(title: title, composer: composer)
									withAnimation {
										doneLoading = true
									}
									try await Task.sleep(nanoseconds: 1000000000) //<-- 1 Sekunde
									dismiss.callAsFunction()
								} catch {
									isLoading = false
									//Error handling here
								}
							}
						} else {
							//Tell em to add info
						}
					} label: {
						Text(isLoading ? "Adding" : "Add Piece")
							.withPrimaryButtonSizeViewModifier()
							.withPrimaryButtonColorModifier()
							.padding()
						//TODO Add Loading View Modifier
					}
				}
				.transition(.slide)
				.frame(maxHeight: .infinity)
			}
		}
	}
}

struct AddEditPieceView_Previews: PreviewProvider {
	
	static var previews: some View {
		
		AddEditPieceView(pieceService: MockPieces())
	}
}
