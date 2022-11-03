//
//  PieceViewSpecial.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceViewSpecial: View {
    var body: some View {
		HStack {
			VStack (alignment: .leading) {
				Text("Title")
				Text("Composer" + " - " + "8 hours practiced")
			}
			Image(systemName: "arrow.forward")
		}
		.border(.red)
    }
}

struct PieceViewSpecial_Previews: PreviewProvider {
    static var previews: some View {
        PieceViewSpecial()
    }
}
