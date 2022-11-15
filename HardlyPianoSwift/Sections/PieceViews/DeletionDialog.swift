//
//  DeletionDialog.swift
//  HardlyPianoSwift
//
//  Created by Paul on 13.11.22.
//

import SwiftUI

struct DeletionDialog: View {
	
	@Environment(\.dismiss) var dismiss
	
	var pieceService: pieceServiceProtocol
	
	@State var isLoading: Bool = false
	@State var isSuccessful: Bool = false

	
	let piece: Piece
	var onCompletion: () -> Void
	var body: some View {
		VStack {
			if isLoading {
				VStack {
					ProgressView().progressViewStyle(.circular)
				}
				.transition(.reverseSlide)
			} else if isSuccessful {
				VStack {
					Image(systemName: "checkmark.circle.fill")
						.background(.clear)
						.foregroundColor(Color("Nocturne3"))
						.font(.system(size: 60))
				}
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.transition(.reverseSlide)
			} else {
				VStack {
					Text("Are you sure you want to delete " + piece.title + "?")
						.font(.headline)
						.multilineTextAlignment(.center)
					
					Button {
						//Delete handler
						isLoading = true
						Task {
							do {
								//Refactor
								if try await pieceService.deletePiece(piece: piece) {
									try await Task.sleep(for: .seconds(1))
									isSuccessful = true
									isLoading = false
									try await Task.sleep(for: .seconds(1))
									onCompletion()
									dismiss.callAsFunction()
								} else {
									//TODO Handle failure too?
									//This is all very confusing
								}
							} catch {
								//TODO Handle failure
							}
						}
					} label: {
						Text("Delete")
							.withPrimaryButtonSizeViewModifier()
							.withDangerButtonColorViewModifier()
					}
					
					Button {
						//Cancel dismiss()
						dismiss.callAsFunction()
					} label: {
						Text("Cancel")
							.withPrimaryButtonSizeViewModifier()
							.withSecondaryButtonStyle()
					}
					
					
				}
				.padding()
				.transition(.reverseSlide)
			}
			
		}
	}
}

struct DeletionDialog_Previews: PreviewProvider {
	static var previews: some View {
		let previewPiece: Piece = Piece(mongoID: "104CET", title: "Etude Op. 10 No. 4", composer: "Chopin", practiceTime: 40)
		DeletionDialog(pieceService: MockPieces(), piece: previewPiece, onCompletion: {})
	}
}
