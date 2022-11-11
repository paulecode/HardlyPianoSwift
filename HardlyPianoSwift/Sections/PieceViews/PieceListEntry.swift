//
//  PieceListEntry.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceListEntry: View {
	
	let title: String
	let practice: Int
	
	var body: some View {
		
		HStack {
			VStack (alignment: .leading, spacing: 8){
				Text(title)
					.font(.headline)
					.fontWeight(.bold)
				Text(practice.description + " hours")
					.font(.subheadline)
					.foregroundColor(Color("Flat3"))
					.fontWeight(.medium)
			}
			Spacer()
			Image(systemName: "arrow.forward")
		}
		.padding(.vertical, 24)
		.padding(.horizontal, 16)
		.background(.clear)
		.frame(maxWidth: .infinity, alignment: .leading)
		.border(Color("Flat3"))
		
	}
}

struct PieceListEntry_Previews: PreviewProvider {
	static var previews: some View {
		PieceListEntry(title: "Apassionata", practice: 5)
	}
}
