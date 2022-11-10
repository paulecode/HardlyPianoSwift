//
//  PieceViewSpecial.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceViewSpecial: View {
    var body: some View {
		HStack (spacing: 12){
			VStack (alignment: .leading, spacing: 4) {
				Text("Title")
				Text("Composer" + " - " + "8 hours practiced")
			}
			Image(systemName: "arrow.forward")
		}
		.frame(maxWidth: .infinity)
		.padding(.vertical)
		.border(Color("Flat3"))
    }
}

struct PieceViewSpecial_Previews: PreviewProvider {
    static var previews: some View {
        PieceViewSpecial()
    }
}
