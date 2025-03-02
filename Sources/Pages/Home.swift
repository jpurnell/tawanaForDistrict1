import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"
	
	func body(context: PublishingContext) -> [BlockElement] {
		// Displays the main flyer text with bold styling
		flyerText("VOTE!", weight: .bold, color: .steelerGold)
		flyerText("Tawana Cook Purnell", weight: .bold)
		flyerText("for District 1", font:. title2)
		flyerText("Pittsburgh Public Schools Board of Directors", font: .title2)
		Group {
			// Displays an image with a description
			Image("/images/photos/tcpFlyer.JPG", description: "Vote Tawana Cook Purnell for District 1 School Board on May 26").resizable().frame(width: 500)
			// Displays a motivational text with specific styling
			flyerText("Preparing Pittsburgh's Children Today for a Better World Tomorrow!", font: .title2, weight: .bold, color: .black, background: .steelerGold).padding(.vertical)
		}.horizontalAlignment(.center)
		Group {
			// Creates modal buttons for different topics
			modalButton("Excellence")
			modalButton("Stewardship")
			modalButton("Safety")
		}.horizontalAlignment(.center)
		// Creates a donation button linking to ActBlue
		donateButton("Support Tawana's Candidacy via ActBlue", destination: "https://www.actblue.com/")
		flyerList(context: context)
		donateButton("Support Tawana's Candidacy via ActBlue", destination: "https://www.actblue.com/")
		
		Group {
			// Creates modals for each topic with specific titles
			modal("excellence", title: "Academic Excellence and Confidence", context: context)
			modal("stewardship", title: "Stewardship of Resources", context: context)
			modal("safety", title: "Safe and Healthy Learning Spaces", context: context)
		}
		Group {
			// Displays social links
			SocialLinks()
		}.frame(maxWidth: .max, alignment: .leading)
	}
}

extension Home {
	/// Creates a modal button with specified title, size, and color.
	/// - Parameters:
	///   - title: The title of the button.
	///   - size: The size of the button (default is .large).
	///   - color: The color of the button (default is .steelerGold).
	/// - Returns: A Button that shows a modal when tapped.
	func modalButton(_ title: String, size: ButtonSize = .large, color: Color = .steelerGold) -> Button {
		return Button(title) { ShowModal(id: "\(title.lowercased())", options: [.focus(true), .keyboard(true)])}.buttonSize(size).foregroundStyle(color)
	}
	
	/// Creates a modal with specified ID and title.
	/// - Parameters:
	///   - id: The identifier for the modal.
	///   - title: The title displayed in the modal.
	///   - alignment: The alignment of the text (default is .leading).
	///   - color: The text color (default is .black).
	///   - size: The font size (default is .title3).
	///   - context: The publishing context containing content.
	/// - Returns: A Modal displaying the content related to the title.
	func modal(_ id: String, title: String, alignment: HorizontalAlignment = .leading, color: Color = .black, size: Font = .title3, context: PublishingContext) -> Modal {
		Modal(id: id) {
			for content in context.allContent.filter({$0.title == title}) {
				Text(content.body).horizontalAlignment(alignment).foregroundStyle(color)
					.font(size)
			}
		}
	}
	
	/// Creates a donation button linking to a specified destination.
	/// - Parameters:
	///   - text: The text displayed on the button.
	///   - destination: The URL to which the button links.
	///   - size: The size of the button (default is .medium).
	/// - Returns: A Text element styled as a button.
	func donateButton(_ text: String, destination: String, size: ButtonSize = .medium) -> Text {
		return Text {
			Link(text, target: destination)
				.linkStyle(.button).buttonSize(size)
		}
		.horizontalAlignment(.center)
		.padding()
	}
	
	/// Creates a list of flyers filtered by a source folder.
	/// - Parameters:
	///   - sourceFolder: The folder from which to filter flyers (default is "flyer").
	///   - context: The publishing context containing content.
	/// - Returns: A List of flyers styled with specific formatting.
	func flyerList(sourceFolder: String = "flyer", context: PublishingContext) -> List {
		List {
			for content in context.allContent.filter({$0.tags.contains(sourceFolder)}).sorted(by: {$0.title < $1.title}) {
				Text(content.body).horizontalAlignment(.leading).foregroundStyle(.steelerGold)
					.font(.title3)
			}
		}.listStyle(.unordered(.default)).foregroundStyle(.steelerGold)
	}
	
	/// Creates a styled text element for flyers.
	/// - Parameters:
	///   - string: The text to display.
	///   - alignment: The alignment of the text (default is .center).
	///   - font: The font style (default is .title1).
	///   - weight: The font weight (default is .medium).
	///   - color: The text color (default is .white).
	///   - background: The background color (default is .black).
	/// - Returns: A Text element with specified styling.
	func flyerText(_ string: String, alignment: HorizontalAlignment = .center, font: Font = .title1, weight: FontWeight = .medium, color: Color = .white, background: Color = .black) -> Text {
		return Text(string).horizontalAlignment(alignment).font(font).fontWeight(weight).background(background).foregroundStyle(color)
	}
}
