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
			Text("Continue practicing")
			Text("This is where you left off")
			PieceViewSpecial()
			Text("Refresh memory")
			Text("You haven't played this one in a while")
			PieceViewSpecial()
			HStack {
				Text("All my pieces")
				Button {
//					Do nothing yet
				} label: {
					Text("Add pieces")
				}

			}
			PieceListView()
			
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
