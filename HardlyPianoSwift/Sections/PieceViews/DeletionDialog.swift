//
//  DeletionDialog.swift
//  HardlyPianoSwift
//
//  Created by Paul on 13.11.22.
//

import SwiftUI

struct DeletionDialog: View {
	
	@Environment(\.dismiss) var dismiss
	let piece: Piece
    var body: some View {
		VStack {
			Text("Are you sure you want to delete " + piece.title + "?")
				.font(.headline)
				.multilineTextAlignment(.center)
			
			Button {
				//Delete handler
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
    }
}

struct DeletionDialog_Previews: PreviewProvider {
    static var previews: some View {
		let previewPiece: Piece = Piece(mongoID: "104CET", title: "Etude Op. 10 No. 4", composer: "Chopin", practiceTime: 40)
        DeletionDialog(piece: previewPiece)
    }
}
