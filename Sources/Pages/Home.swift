import Foundation
import Ignite

struct Home: StaticLayout {
    var title = "Home"

    var body: some HTML {
		Group {
			Text("VOTE!").horizontalAlignment(.center).font(.title1).fontWeight(.bold).foregroundStyle(.gold)
			Text("TAWANA COOK PURNELL").horizontalAlignment(.center).font(.title1).fontWeight(.heavy)
			Text("FOR DISTRICT 1").horizontalAlignment(.center).font(.title2).fontWeight(.bold)
			Text("PITTSBURGH PUBLIC SCHOOLS BOARD OF DIRECTORS").horizontalAlignment(.center).font(.title2).fontWeight(.light)
		}
		.foregroundStyle(.white)
		.frame(alignment: .center)
		.padding()
		VStack {
			Image("/images/tcpFlyer.JPG",
				  description: "Vote Tawana Cook Purnell for District 1 School Board on May 26")
				.resizable()
				.padding(.horizontal)
			Text("PREPARING PITTSBURGH'S CHILDREN TODAY FOR A BETTER WORLD TOMORROW!")
				.horizontalAlignment(.center)
				.font(.title2)
				.fontWeight(.bold)
				.background(Color.gold)
				.foregroundStyle(.black)
				.padding(.vertical)
		}
		VStack {
			Link("Support My Candidacy via ActBlue", target: "https://www.actblue.com/")
				.linkStyle(.button).target(.newWindow)
		}.frame(alignment: .center).padding()
		List {
			Text(markdown: "A highly experienced **EDUCATOR** with a graduate degree in **SCHOOL LEADERSHIP**")
			Text(markdown: "Known for creating **SAFE** and **HEALTHY** schools")
			Text(markdown: "Spent a career as a **TEACHER** and **ADMINISTRATOR**")
			Text(markdown: "Served in public, independent, catholic, and charter schools")
			Text(markdown: "Worked on local, regional, and national boards")
			Text(markdown: "Makes bold, thoughtful decisions that support **STUDENT SUCCESS**, enhance **FACULTY SATISFACTION**, increase **FAMILY ENGAGEMENT**, and build **COMMUNITY COLLABORATIONS**")
		}.font(.title3)
		.foregroundStyle(.white)
		.padding(.top)
		VStack {
			Link("Support My Candidacy via ActBlue", target: "https://www.actblue.com/")
				.linkStyle(.button).target(.newWindow)
		}.frame(alignment: .center).padding()
    }
}
