//
//  PieceViewDetail.swift
//  HardlyPianoSwift
//
//  Created by Paul on 12.11.22.
//

import SwiftUI

struct PieceViewDetail: View {
	
	var title: String
	
    var body: some View {
		VStack (spacing: 16){
			VStack (alignment: .leading, spacing: 8) {
				Text(title)
					.font(.title2)
					.fontWeight(.bold)
				Text("J. S. Bach")
					.font(.subheadline)
					.fontWeight(.medium)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
//			.border(.red)
			
			HStack (spacing: 0) {
				VStack (alignment: .leading, spacing: 4) {
					Text("Total practice")
						.font(.subheadline)
						.foregroundColor(Color("Flat4"))
						.fontWeight(.medium)
					Text("4 hours")
						.font(.headline)
						.fontWeight(.bold)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
//				.border(.green)
				VStack (alignment: .leading) {
					Text("Last practiced")
						.font(.subheadline)
						.foregroundColor(Color("Flat4"))
						.fontWeight(.medium)
					Text("2 weeks ago")
						.font(.headline)
						.fontWeight(.bold)
				}
				.frame(maxWidth: .infinity, alignment: .leading)
//				.border(.blue)
			}
//			.border(.cyan)
			
			Button {
				//Practice
			} label: {
				Text("Practice")
					.withPrimaryButtonSizeViewModifier()
					.withPrimaryButtonColorModifier()
			}
			
			Button {
				//View Practice history
			} label: {
				Text("View practice history")
					.withPrimaryButtonSizeViewModifier()
					.withSecondaryButtonStyle()
			}
			
			Divider()
			
			Button {
				//Edit piece
			} label: {
				Text("Edit piece details")
			}
			
			Button {
				//Delete piece
			} label: {
				Text("Delete piece")
			}
//			.border(.yellow)
			
		}
		.padding()
//		.border(.black)
    }
}

struct PieceViewDetail_Previews: PreviewProvider {
    static var previews: some View {
		PieceViewDetail(title: "Prelude in C Major")
    }
}
