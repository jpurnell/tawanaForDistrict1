	//
	//  SocialLinks.swift
	//  IgniteStarter
	//
	//  Created by Justin Purnell on 10/1/24.
	//


import Foundation
import Ignite

public struct SocialLinks: Component {
	var links: [SocialLink] = socialLinkList
	
	public func body(context: PublishingContext) -> [any PageElement] {
		for link in links {
			Text {
				Link(
					Image(link.fullLink, description: "Join Tawana on \(link.site)")
						.resizable()					
						.opacity(1.0)
						.foregroundStyle(.steelerGold)
					, target: link.link)
				.role(.secondary)
				.target(.newWindow)
				.relationship(.me)
			}.class("column").frame(width: 20, height: 20)
		}
	}
	
	public init() {}
	
}
