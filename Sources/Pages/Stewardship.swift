import Foundation
import Ignite

struct Stewardship: StaticPage {
    var title = "Stewardship of Resources"

    func body(context: PublishingContext) -> [BlockElement] {
		Text("Stewardship of Resources").font(.title1).class("mainTitle").foregroundStyle(.light)
		for content in context.allContent.filter({$0.title == "Stewardship of Resources"}) {
			Image(content.image ?? "default", description: (content.metadata["imageDescription"] as! String))
				.resizable()
				.frame(width: "300px")
				.padding(.horizontal, "10px")
				.style("float: left", "margin-right: 5%", "margin-bottom: 1%")
			Text(content.body).foregroundStyle(.steelerGold)
				.frame(width: "70%", maxWidth: "800px")
		}
	}
}
