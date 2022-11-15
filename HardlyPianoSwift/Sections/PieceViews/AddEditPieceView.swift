//
//  AddEditPieceView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 10.11.22.
//

import SwiftUI

struct AddEditPieceView: View {
	
	@Environment(\.dismiss) var dismiss
	
	@State private var title: String
	@State private var composer: String
	@State private var isLoading: Bool = false
	@State private var doneLoading: Bool = false
	@State private var edit: Bool
	
	var oldPiece: Piece?
	
	@FocusState private var titleIsFocussed: Bool
	@FocusState private var composerIsFocussed: Bool
	
	var pieceService: pieceServiceProtocol
	var onComplete: (Piece) -> Void
	
	init(oldPiece: Piece? = nil, pieceService: pieceServiceProtocol, onComplete: @escaping (Piece) -> Void) {
		self.oldPiece = oldPiece
		self.pieceService = pieceService
		self.onComplete = onComplete
		
		self._title = State(initialValue: oldPiece?.title ?? "")
		self._composer = State(initialValue: oldPiece?.composer ?? "")
		self._edit = State(initialValue: oldPiece == nil ? false : true)
//		if let oldPiece {
//			print(oldPiece)
//
//			composer = oldPiece.composer
//			edit = true
//		} else {
//
//			self._composer = State(initialValue: "")
//		}
	}
	
	//TODO Make Textfields mandatory.
	
	var body: some View {
		VStack {
			if isLoading {
				VStack {
					ProgressView().progressViewStyle(.circular)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.transition(.reverseSlide)
			} else if doneLoading {
				Image(systemName: "checkmark.circle.fill")
					.background(.clear)
					.foregroundColor(Color("Nocturne3"))
					.font(.system(size: 60))
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.transition(.reverseSlide)
			} else {
				VStack {
					HStack {
						Text(!edit ? "Add piece" : "Edit piece" )
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
									if let oldPiece {
										
										let newPiece =  try await pieceService.updatePiece(oldPiece: oldPiece, title: title, composer: composer)
//										let newPiece =  try await pieceService.updatePiece(oldPiece: oldPiece, title: title, composer: composer)
//											let newPiece = Piece(mongoID: oldPiece.mongoID, title: oldPiece.title, composer: oldPiece.composer)
//											pieces = pieces.filter({$0 != oldPiece})
//											pieces.append(newPiece)
											
											onComplete(newPiece)
//										withAnimation {
//											doneLoading
//										}
										
									} else if !edit {
										_ = try await pieceService.postPiece(title: title, composer: composer)
									}
									try await Task.sleep(for: .seconds(1))
									withAnimation {
										doneLoading = true
										isLoading = false
									}
									try await Task.sleep(for: .seconds(1))
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
						Text(!edit ? "Add piece" : "Save changes")
							.withPrimaryButtonSizeViewModifier()
							.withPrimaryButtonColorModifier()
							.padding()
						//TODO Add Loading View Modifier
					}
				}
				.transition(.reverseSlide)
				.frame(maxHeight: .infinity)
			}
		}
	}
}

struct AddEditPieceView_Previews: PreviewProvider {
	
	static var previews: some View {
		
		AddEditPieceView(oldPiece: nil, pieceService: MockPieces(), onComplete: {_ in})
	}
}
