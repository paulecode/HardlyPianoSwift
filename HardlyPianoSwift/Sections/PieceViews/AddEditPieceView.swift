//
//  AddEditPieceView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 10.11.22.
//

import SwiftUI

struct AddEditPieceView: View {

	@Environment(\.dismiss) var dismiss
	@State var title: String = ""
	@State var composer: String = ""
	@FocusState private var titleIsFocussed: Bool
	@FocusState private var composerIsFocussed: Bool
	
	var body: some View {
		VStack {
			HStack {
				Text("Add or Edit Piece")
					.font(.title)
				Spacer()
				Button {
					//Cancel
					dismiss.callAsFunction()
				} label: {
					Image(systemName: "x.circle.fill")
						.foregroundColor(.gray)
				}

			}
			.padding()
			
//			Spacer()
			VStack (alignment: .leading) {
				Text("Piece name")
					.fontWeight(.bold)
				TextField("Nocturne Op. 48 No. 1", text: $title)
					.focused($titleIsFocussed)
				Divider()
					.frame(height: 1)
					.background(titleIsFocussed ? .black : .gray)
			}
			.padding()
			
			VStack (alignment: .leading) {
				Text("Composer")
					.fontWeight(.bold)
				TextField("Chopin", text: $composer)
					.focused($composerIsFocussed)
				Divider()
					.frame(height: 1)
					.background(composerIsFocussed ? .black : .gray)
			}
			.padding()
//			Spacer()
			Button {
				//Add Piece
			} label: {
				Text("Add Piece")
					.withPrimaryButtonSizeViewModifier()
					.withPrimaryButtonColorModifier()
					.padding()
					
			}


		}
//		.background(Color("Flat9"))
	}
}

struct AddEditPieceView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditPieceView()
    }
}
