//
//  MainView.swift
//  HardlyPianoSwift
//
//  Created by Paul on 11.11.22.
//

import SwiftUI

struct MainView: View {
	
	@State var showAddTitle: Bool = false
	@Binding var selectedView: Int
	@EnvironmentObject var userSession: UserSession
	
	var pieceService: pieceServiceProtocol
	@State var pieces: [Piece] = []
	
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
					VStack (spacing: 4) {
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
					
					PieceListView(background: Color("Flat" + selectedView.description), pieceService: pieceService, pieces: $pieces)
					
					Divider()
					Button {
						//Add Piece
						showAddTitle = true
					} label: {
						Text("Add Piece")
							.withPrimaryButtonSizeViewModifier()
							.withPrimaryButtonColorModifier()
							.padding()
						//TODO Fix this
					}
					.sheet(isPresented: $showAddTitle, onDismiss: {
						Task {
							await loadData()
						}
					}) {
						AddEditPieceView(pieces: $pieces, pieceService: pieceService)
							.background(.ultraThinMaterial)
							.presentationDetents([.medium])
							.onAppear{
								guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
									  let controller = windowScene.windows.first?.rootViewController?.presentedViewController
								else {
									return
								}
								controller.view.backgroundColor = .clear
							}
							
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
		.onAppear {
			pieceService.setToken(token: userSession.token ?? "PreviewToken")
		}
		.task {
				await loadData()
		}
		.refreshable {
			await loadData()
		}
	}
	
	func loadData() async{
		do {
			pieces = try await pieceService.getAllPieces()
		} catch {
			//ErrorHandling
		}
	}
}

struct MainView_Previews: PreviewProvider {

	static var userSession: UserSession = UserSession()

	

	static var previews: some View {
		
		MainView(selectedView: .constant(7), pieceService: MockPieces())
			.environmentObject(UserSession()) //<- Insanity
	}
}
