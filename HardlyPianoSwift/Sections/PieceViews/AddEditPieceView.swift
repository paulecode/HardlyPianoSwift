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
	@State var edit: Bool = false
	
	var oldPiece: Piece? = nil
	
	@Binding var pieces: [Piece]
	
	@FocusState private var titleIsFocussed: Bool
	@FocusState private var composerIsFocussed: Bool
	
	var pieceService: pieceServiceProtocol
	
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
									if oldPiece != nil {
										if try await pieceService.updatePiece(oldPiece: oldPiece!, title: title, composer: composer) {
											let newPiece = Piece(mongoID: oldPiece?.mongoID ?? "noID", title: oldPiece?.title ?? "noTitle", composer: oldPiece?.composer ?? "noComposer")
//											pieces = pieces.filter({$0 != oldPiece})
											pieces.append(newPiece)
										}
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
		
		AddEditPieceView(pieces: .constant(MockPieces().pieces), pieceService: MockPieces())
	}
}
