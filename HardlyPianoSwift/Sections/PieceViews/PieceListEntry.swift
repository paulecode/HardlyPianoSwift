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
	@State var isExpanded: Bool = false
	var body: some View {
		
		VStack {
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
			if isExpanded {
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
			}
		}
		.padding(.vertical, 24)
		.padding(.horizontal, 16)
		.background(.clear)
		.frame(maxWidth: .infinity, alignment: .leading)
		.border(Color("Flat3"))
		.onTapGesture {
			expandSheet()
		}

	}
	
	func expandSheet() {
		
		withAnimation {
			isExpanded.toggle()
		}
	}
}

struct PieceListEntry_Previews: PreviewProvider {
	static var previews: some View {
		PieceListEntry(title: "Apassionata", practice: 5)
	}
}
