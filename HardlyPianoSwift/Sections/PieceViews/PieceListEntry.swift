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

		VStack (alignment: .leading) {
			Text(title)
			Text(composer + " - " + practice.description + " hours")
		}
    }
}

struct PieceListEntry_Previews: PreviewProvider {
    static var previews: some View {
		PieceListEntry(title: "Apassionata", composer: "Beethoven", practice: 5)
    }
}
