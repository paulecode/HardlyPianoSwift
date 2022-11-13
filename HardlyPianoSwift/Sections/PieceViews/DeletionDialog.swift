//
//  DeletionDialog.swift
//  HardlyPianoSwift
//
//  Created by Paul on 13.11.22.
//

import SwiftUI

struct DeletionDialog: View {
    var body: some View {
		VStack {
			Text("Are you sure you want to delete this piece?")
				.font(.headline)
			
			Button {
				//Delete
			} label: {
				Text("Delete")
					.withPrimaryButtonSizeViewModifier()
					.withDangerButtonColorViewModifier()
			}
			
			Button {
				//Cancel
			} label: {
				Text("Cancel")
					.withPrimaryButtonSizeViewModifier()
					.withSecondaryButtonStyle()
			}

		}
    }
}

struct DeletionDialog_Previews: PreviewProvider {
    static var previews: some View {
        DeletionDialog()
    }
}
