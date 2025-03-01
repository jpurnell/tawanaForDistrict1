import Foundation
import Ignite

struct Endorsements: StaticPage {
	var title = "Endorsements"

	func body(context: PublishingContext) -> [BlockElement] {
		Text("Endorsements").font(.title1).class("mainTitle").foregroundStyle(.light)
		for content in context.allContent.filter({$0.title == "endorsers"}) {
			Image(content.image ?? "default", description: (content.metadata["imageDescription"] as! String))
				.resizable()
				.frame(width: "300px")
				.padding(.horizontal, "10px")
				.style("float: left", "margin-right: 5%", "margin-bottom: 1%")
			Text(content.body).foregroundStyle(.light)
				.frame(width: "70%", maxWidth: "800px")
		}
	}
}
