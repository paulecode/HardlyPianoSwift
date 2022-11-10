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
					.fontWeight(.bold)
				HStack {
					Text(composer)
						.font(.subheadline)
						.foregroundColor(Color("Flat3"))
						.fontWeight(.medium)
					Text(practice.description + " hours")
						.font(.subheadline)
						.foregroundColor(Color("Flat5"))

				}
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 24)
			.padding(.vertical, 16)
		}
		.frame(maxWidth: .infinity)
		.background(Color("Flat9"))
	}
}

struct PieceListEntry_Previews: PreviewProvider {
	static var previews: some View {
		PieceListEntry(title: "Apassionata", composer: "Beethoven", practice: 5)
	}
}
