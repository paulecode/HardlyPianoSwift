//
//  PieceViewSpecial.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceViewSpecial: View {
	
	let title: String
	let composer: String
	let practice: Int

    var body: some View {
		HStack (spacing: 12){
			VStack (alignment: .leading, spacing: 4) {
				Text(title)
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
			Spacer()
			Image(systemName: "arrow.forward")
		}
		.frame(maxWidth: .infinity)
		.padding()
		.border(Color("Flat3"))
    }
}

struct PieceViewSpecial_Previews: PreviewProvider {
    static var previews: some View {
        PieceViewSpecial(title: "Lacrimosa", composer: "Mozart", practice: 5)
    }
}
