//
//  NavBar.swift
//  IgniteStarter
//
//  Created by Justin Purnell on 2/28/25.
//
import Foundation
import Ignite

enum FontFamily: String, Codable {
	case princetonMonticello = "princeton_monticello"
	case tayLennon = "TAYLennonRegular"
	case libreFranklin = "Libre Franklin"
	case franklinGothic = "franklin_gothic"
	case gotham
}

public struct NavBar: Component {
	public init() { }
	
	/// Generates the HTML for the logo in the navigation bar.
	/// - Parameters:
	///   - image: The URL of the logo image (default is "/images/logos/bonsai_steelerGold.svg").
	///   - altText: The alternative text for the image (default is "Tawana Purnell for District 1").
	///   - width: The width of the image in pixels (default is 60).
	///   - height: The height of the image in pixels (default is 60).
	///   - destination: The URL to navigate to when the logo is clicked (default is "/").
	/// - Returns: A string containing the HTML for the logo.
	func logo(_ image: String = "/images/logos/bonsai_steelerGold.svg", altText: String = "Tawana Purnell for District 1", _ width: Int = 60, _ height: Int = 60, destination: String = "/") -> String  {
		return "<a href=\"\(deployment().rawValue)\" class=\"navbar-brand\" aria-label=\"home\"><img src=\"\(image)\" aria-label=\"\(altText)\" class=\"img-fluid mx-auto\" style=\"width: \(width)px; height: \(height)px\"></a>"
	}
	
	/// Generates the HTML for the header in the navigation bar.
	/// - Parameters:
	///   - message: The message to display in the header (default is "Tawana Cook Purnell").
	///   - fontFamily: The font family to use for the header text (default is .princetonMonticello).
	/// - Returns: A string containing the HTML for the header.
	func header(_ message: String = "Tawana Cook Purnell", _ fontFamily: FontFamily = .princetonMonticello) -> String {
		return "<a href=\"\(deployment().rawValue)\" class=\"navbar-brand\"><h3 style=\"font-family: \(fontFamily.rawValue); font-size: calc(1.2rem + .5vw); color: #ffb612; line-height: 2rem; margin-bottom: 0rem; text-align: center; class=\"text-center mx-auto\">\(message)</h2>"
	}
	
	/// Generates the HTML for the kicker text in the navigation bar.
	/// - Parameters:
	///   - message: The message to display as the kicker (default is "For District 1").
	///   - fontFamily: The font family to use for the kicker text (default is .princetonMonticello).
	/// - Returns: A string containing the HTML for the kicker.
	func kicker(_ message: String = "For District 1", _ fontFamily: FontFamily = .princetonMonticello) -> String {
		"<h4 style=\"font-family: \(fontFamily.rawValue); font-size: calc(0.55rem + 0.5vw); color: var(--bs-light); line-height: 1rem; padding: 0em; margin-bottom: 0rem; letter-spacing: .10rem; class=\"text-center mx-auto\">\(message)</h4></a>"
	}
	
	/// Combines the logo, header, and kicker into a single string for the navigation bar.
	/// - Parameters:
	///   - logo: The HTML string for the logo.
	///   - header: The HTML string for the header.
	///   - kicker: The HTML string for the kicker.
	/// - Returns: A string containing the combined HTML for the navigation bar.
	func navBarString(logo: String, _ header: String, _ kicker: String) -> String {
		return """
   \(logo)
   \(header)
   \(kicker)
"""
	}
	
	/// Generates the body of the navigation bar component.
	/// - Parameter context: The publishing context containing information about the current page.
	/// - Returns: An array of page elements representing the navigation bar.
	public func body(context: PublishingContext) -> [any PageElement] {
		NavigationBar(logo: navBarString(logo: logo("/images/logos/bonsai_steelerGold.svg", altText: "Tawana Cook Purnell for District 1", 60, 60), header("Tawana Cook Purnell"), kicker("Pittsburgh Public Schools, District 1"))) {
			Link(Button("Meet Tawana").id("Meet Tawana").buttonSize(.small).foregroundStyle(.steelerGold), target: Meet())
			Link(Button("Excellence").id("Excellence").buttonSize(.small).foregroundStyle(.steelerGold), target: Excellence())
			Link(Button("Stewardship").id("Stewardship").buttonSize(.small).foregroundStyle(.steelerGold), target: Stewardship())
			Link(Button("Safety").id("Safety").buttonSize(.small).foregroundStyle(.steelerGold), target: Safety())
			Link(Button("Endorsements").id("Endorsements").buttonSize(.small).foregroundStyle(.steelerGold), target: Endorsements())
			Link(target: "mailto:tawanaForDistrict1@gmail.com") {
				Button("Contact").id("Contact").buttonSize(.small).foregroundStyle(.steelerGold)
			}
			Link(Button("Donate").buttonSize(.small).role(.primary), target: "https://www.actblue.com/")
		}
		.navigationItemAlignment(.trailing)
		.navigationBarStyle(.light)
	}
}


