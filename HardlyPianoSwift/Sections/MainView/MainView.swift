//
//  MainView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 11.11.22.
//

import SwiftUI

struct MainView: View {
	
	@Binding var selectedView: Int
	@EnvironmentObject var userSession: UserSession
	var pieces: [Piece] = MockPieces().pieces
	
	var body: some View {
		ZStack {
			TabView (selection: $selectedView) {
				
				//TabView Page 1
				VStack (spacing: 16) {
					VStack (spacing: 4){
						Text("Continue practicing")
							.font(.title3)
							.fontWeight(.bold)
						Text("This is where you left off:")
							.font(.subheadline)
							.foregroundColor(Color("Flat3"))
					}
					
					.padding(.horizontal, 24)
					PieceViewSpecial(title: "Nocturne", composer: "Chopin", practice: 5)
						.padding(.horizontal, 24)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(.clear)
				.tabItem {
					Text("Continue")
				}
				.tag(7)
				//Page 1 End
				
				//TabView Page 2
				VStack (spacing: 16) {
					VStack (spacing: 4){
						Text("Refresh memory")
							.font(.title3)
							.fontWeight(.bold)
						Text("You haven't practiced this in a while:")
							.font(.subheadline)
							.foregroundColor(Color("Flat3"))
					}
					
					.padding(.horizontal, 24)
					PieceViewSpecial(title: "Nocturne", composer: "Chopin", practice: 5)
						.padding(.horizontal, 24)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(.clear)
				.tabItem {
					Text("Refresh")
				}
				.tag(8)
				//Page 2 End
				
				//TabView Page 3
				VStack (spacing: 0){
					
					PieceListView(
						background: Color("Flat" + selectedView.description)
					)
					Divider()
					Button {
						//Add Piece
					} label: {
						Text("Add Piece")
							.withPrimaryButtonSizeViewModifier()
							.withPrimaryButtonColorModifier()
							.padding()
						//TODO Fix this
					}
					
				}
				.padding(.bottom)
				.tabItem {
					Text("Piece List")
				}
				.tag(9)
				
				//tmp area
				Button {
					userSession.signOut()
				} label: {
					Text("sign out")
						.withPrimaryButtonSizeViewModifier()
						.withPrimaryButtonColorModifier()
						.padding(.horizontal, 16)
				}
				.tabItem {
					Text("Logout")
				}
				.tag(6)
				
				//tmp area
			}
			.background(Color("Flat" + selectedView.description))
			.animation(.easeInOut, value: selectedView)
			.tabViewStyle(.page)
		}
	}
}

struct MainView_Previews: PreviewProvider {
	
	static var previews: some View {
		MainView(selectedView: .constant(7))
	}
}
