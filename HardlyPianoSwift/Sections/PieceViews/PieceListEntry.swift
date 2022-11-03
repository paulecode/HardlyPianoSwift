//
//  PieceListEntry.swift
//  HardlyPianoSwift
//
//  Created by Paul on 03.11.22.
//

import SwiftUI

struct PieceListEntry: View {
    var body: some View {
		VStack (alignment: .leading) {
			Text("Title")
			Text("Composer - 2 hours")
		}
    }
}

struct PieceListEntry_Previews: PreviewProvider {
    static var previews: some View {
        PieceListEntry()
    }
}
