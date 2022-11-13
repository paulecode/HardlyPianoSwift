//
//  DeletionDialog.swift
//  HardlyPianoSwift
//
//  Created by Paul on 13.11.22.
//

import SwiftUI

struct DeletionDialog: View {
	@Environment(\.dismiss) var dismiss
    var body: some View {
		VStack {
			Text("Are you sure you want to delete this piece?")
				.font(.headline)
			
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
        DeletionDialog()
    }
}
