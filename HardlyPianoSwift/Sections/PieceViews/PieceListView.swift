//
//  PieceListView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceListView: View {
	let numbers: [String] = ["one", "two", "three"]
	
    var body: some View {
		List {
			ForEach(numbers, id: \.self) { number in
				PieceListEntry()
			}
//			.onDelete(perform: stupidMockFunction)
			.swipeActions {
				Button {
//					Do nothing
				} label: {
					Text("Test")
				}
						.tint(.red)

			}
		}
		
    }
	
	func stupidMockFunction(at offsets: IndexSet) {
		return
	}
}

struct PieceListView_Previews: PreviewProvider {
    static var previews: some View {
        PieceListView()
    }
}
