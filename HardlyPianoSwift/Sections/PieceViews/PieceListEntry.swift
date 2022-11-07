//
//  PieceListEntry.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceListEntry: View {
	
	let title: String
	let composer: String
	let practice: Int
	
    var body: some View {

		HStack {
			VStack (alignment: .listRowSeparatorLeading, spacing: 4) {
				Text(title)
					.font(.headline)
				Text(composer + " - " + practice.description + " hours")
					.font(.subheadline)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 24)
			.padding(.vertical, 16)
			Spacer()
		}
		.frame(maxWidth: .infinity)
		.border(.red)
    }
}

struct PieceListEntry_Previews: PreviewProvider {
    static var previews: some View {
		PieceListEntry(title: "Apassionata", composer: "Beethoven", practice: 5)
    }
}
