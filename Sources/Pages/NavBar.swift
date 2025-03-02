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
	
	func logo(_ image: String = "/images/Logo_2000Reunion_TIGER_Color_60px.png", altText: String = "Tawana Purnell for District 1", _ width: Int = 72, _ height: Int = 72, destination: String = "/") -> String  {
		return "<a href=\"\(deployment().rawValue)\" class=\"navbar-brand\" aria-label=\"home\"><img src=\"\(image)\" aria-label=\"\(altText)\" class=\"img-fluid mx-auto\" style=\"width: \(width)px; height: \(height)px\"></a>"
	}
	func header(_ message: String = "Tawana Cook Purnell", _ fontFamily: FontFamily = .princetonMonticello) -> String {
		return "<a href=\"\(deployment().rawValue)\" class=\"navbar-brand\"><h3 style=\"font-family: \(fontFamily.rawValue); font-size: calc(1.2rem + .5vw); color: #ffb612; line-height: 2rem; margin-bottom: 0rem; text-align: center; class=\"text-center mx-auto\">\(message)</h2>"
	}
	func kicker(_ message: String = "For District 1", _ fontFamily: FontFamily = .princetonMonticello) -> String {
		"<h4 style=\"font-family: \(fontFamily.rawValue); font-size: calc(0.55rem + 0.5vw); color: var(--bs-light); line-height: 1rem; padding: 0em; margin-bottom: 0rem; letter-spacing: .10rem; class=\"text-center mx-auto\">\(message)</h4></a>"
	}
	
	func navBarString(logo: String, _ header: String, _ kicker: String) -> String {
		return """
   \(logo)
   \(header)
   \(kicker)
"""
	}
	

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


