import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"
	
	func body(context: PublishingContext) -> [BlockElement] {
		// MARK: - Call to Action
		Group {
			Text("VOTE!").horizontalAlignment(.center).font(.title1).fontWeight(.bold).foregroundStyle(.steelerGold).background(.black)
			Text("TAWANA COOK PURNELL").horizontalAlignment(.center).font(.title1).fontWeight(.heavy)
			Text("FOR DISTRICT 1").horizontalAlignment(.center).font(.title2).fontWeight(.bold)
			Text("PITTSBURGH PUBLIC SCHOOLS BOARD OF DIRECTORS").horizontalAlignment(.center).font(.title2).fontWeight(.light)
		}
		.foregroundStyle(.white)
		.padding()
		// MARK: - Image and Banner
		Group {
			Image("/images/photos/tcpFlyer.JPG",
				  description: "Vote Tawana Cook Purnell for District 1 School Board on May 26")
			.resizable()
			.frame(width: 500)
			Text("PREPARING PITTSBURGH'S CHILDREN TODAY FOR A BETTER WORLD TOMORROW!")
				.font(.title2)
				.fontWeight(.bold)
				.background(Color.steelerGold)
				.foregroundStyle(.black)
				.padding(.vertical)
		}
		.padding(.horizontal)
		.frame(maxWidth: "90%", alignment: .center)
		.horizontalAlignment(.center)
		// MARK: - Modal Buttons
		Group {
			Button("Excellence") {
				ShowModal(id: "excellence")
			}.buttonSize(.large).foregroundStyle(.steelerGold)
//				Spacer(size: 10)
			Button("Stewardship") {
				ShowModal(id: "stewardship")
			}.buttonSize(.large).foregroundStyle(.steelerGold)
//				Spacer(size: 20)
			Button("Safety") {
				ShowModal(id: "safety")
			}.buttonSize(.large).foregroundStyle(.steelerGold)
//				Spacer(size: 20)
		}.frame(width: "90%")
			.horizontalAlignment(.center)
		// MARK: - Modal Frames
		Group {
			Modal(id: "excellence") {
				for content in context.allContent.filter({$0.title == "Academic Excellence and Confidence"}) {
					Text(content.body).horizontalAlignment(.leading).foregroundStyle(.black)
						.font(.title3)
				}
			}
			Modal(id: "stewardship") {
				for content in context.allContent.filter({$0.title == "Stewardship of Resources"}) {
					Text(content.body).horizontalAlignment(.leading).foregroundStyle(.black)
						.font(.title3)
				}
			}
			Modal(id: "safety") {
				for content in context.allContent.filter({$0.title == "Safe and Healthy Learning Spaces"}) {
					Text(content.body).horizontalAlignment(.leading).foregroundStyle(.black)
						.font(.title3)
				}
			}
		}

		// MARK: - Actblue Link
		Text {
			Link("Support Tawana's Candidacy via ActBlue", target: "https://www.actblue.com/")
				.linkStyle(.button)
		}
		.horizontalAlignment(.center)
		.padding()
		// MARK: - Position List
		List {
			for content in context.allContent.filter({$0.tags.contains("flyer")}).sorted(by: {$0.title < $1.title}) {
				Text(content.body).horizontalAlignment(.leading).foregroundStyle(.steelerGold)
					.font(.title3)
			}
		}.listStyle(.unordered(.default)).foregroundStyle(.steelerGold)
		// MARK: - Actblue Link
		Text {
			Link("Support Tawana's Candidacy via ActBlue", target: "https://www.actblue.com/")
				.linkStyle(.button)
		}
		.horizontalAlignment(.center)
		.padding()
		
	}
}
