//
//  HomeView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct HomeView: View {
	var body: some View {
		VStack {
			HStack {
				Text("Top Bar")
				Image(systemName: "gearshape.fill")
			}
			//Replace with top bar
			VStack (spacing: 16) {
				VStack (alignment: .leading, spacing: 4){
					Text("Continue practicing")
						.font(.title3)
						.fontWeight(.bold)
					Text("This is where you left off:")
						.font(.subheadline)
						.foregroundColor(Color("Flat3"))
				}
				.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 24)
				PieceViewSpecial()
					.padding(.horizontal)

			}
			

			VStack (alignment: .leading, spacing: 4){
				Text("Refresh Memory")
					.font(.title3)
					.fontWeight(.bold)
				Text("You haven't practiced this in a while:")
					.font(.subheadline)
					.foregroundColor(Color("Flat3"))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			.padding(.horizontal, 24)
			
			PieceViewSpecial()
			
			HStack {
				Text("All my pieces")
				Spacer()
				Button {
					//					Do nothing yet
				} label: {
					Text("+ Add new piece")
						.foregroundColor(Color("Flat3"))
				}
				
			}
			.padding()
			PieceListView()
			
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(Color("Flat9"))
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
