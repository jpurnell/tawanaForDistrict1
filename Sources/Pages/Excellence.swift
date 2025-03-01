import Foundation
import Ignite

struct Excellence: StaticPage {
    var title = "Academic Excellence and Confidence"

    func body(context: PublishingContext) -> [BlockElement] {
		Text("Academic Excellence and Confidence").font(.title1).class("mainTitle").foregroundStyle(.light)
		for content in context.allContent.filter({$0.title == "Academic Excellence and Confidence"}) {
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
