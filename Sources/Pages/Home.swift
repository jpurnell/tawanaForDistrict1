import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"
	
	func body(context: PublishingContext) -> [BlockElement] {
		flyerText("VOTE!", weight: .bold, color: .steelerGold)
		flyerText("Tawana Cook Purnell", weight: .bold)
		flyerText("for District 1", font:. title2)
		flyerText("Pittsburgh Public Schools Board of Directors", font: .title2)
		Group {
			Image("/images/photos/tcpFlyer.JPG", description: "Vote Tawana Cook Purnell for District 1 School Board on May 26").resizable().frame(width: 500)
			flyerText("Preparing Pittsburgh's Children Today for a Better World Tomorrow!", font: .title2, weight: .bold, color: .black, background: .steelerGold).padding(.vertical)
		}.horizontalAlignment(.center)
		Group {
			modalButton("Excellence")
			modalButton("Stewardship")
			modalButton("Safety")
		}.horizontalAlignment(.center)
		donateButton("Support Tawana's Candidacy via ActBlue", destination: "https://www.actblue.com/")
		flyerList(context: context)
		donateButton("Support Tawana's Candidacy via ActBlue", destination: "https://www.actblue.com/")
		
		Group {
			modal("excellence", title: "Academic Excellence and Confidence", context: context)
			modal("stewardship", title: "Stewardship of Resources", context: context)
			modal("safety", title: "Safe and Healthy Learning Spaces", context: context)
		}
		Group {
			SocialLinks()
		}.frame(maxWidth: .max, alignment: .leading)
	}
}

extension Home {
	func modalButton(_ title: String, size: ButtonSize = .large, color: Color = .steelerGold) -> Button {
		return Button(title) { ShowModal(id: "\(title.lowercased())", options: [.focus(true), .keyboard(true)])}.buttonSize(size).foregroundStyle(color)
	}
	
	func modal(_ id: String, title: String, alignment: HorizontalAlignment = .leading, color: Color = .black, size: Font = .title3, context: PublishingContext) -> Modal {
		Modal(id: id) {
			for content in context.allContent.filter({$0.title == title}) {
				Text(content.body).horizontalAlignment(alignment).foregroundStyle(color)
					.font(size)
			}
		}
	}
	
	func donateButton(_ text: String, destination: String, size: ButtonSize = .medium) -> Text {
		return Text {
			Link(text, target: destination)
				.linkStyle(.button).buttonSize(size)
		}
		.horizontalAlignment(.center)
		.padding()
	}
	
	func flyerList(sourceFolder: String = "flyer", context: PublishingContext) -> List {
		List {
			for content in context.allContent.filter({$0.tags.contains(sourceFolder)}).sorted(by: {$0.title < $1.title}) {
				Text(content.body).horizontalAlignment(.leading).foregroundStyle(.steelerGold)
					.font(.title3)
			}
		}.listStyle(.unordered(.default)).foregroundStyle(.steelerGold)
	}
	
	func flyerText(_ string: String, alignment: HorizontalAlignment = .center, font: Font = .title1, weight: FontWeight = .medium, color: Color = .white, background: Color = .black) -> Text {
		return Text(string).horizontalAlignment(alignment).font(font).fontWeight(weight).background(background).foregroundStyle(color)
	}
}
