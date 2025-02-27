import Foundation
import Ignite

struct Home: StaticLayout {
    var title = "Home"

    var body: some HTML {
		Group {
			Text("VOTE").horizontalAlignment(.center).font(.title1).fontWeight(.bold).foregroundStyle(.gold)
			Text("TAWANA COOK PURNELL").horizontalAlignment(.center).font(.title1).fontWeight(.heavy)
			Text("FOR DISTRICT 1").horizontalAlignment(.center).font(.title2).fontWeight(.bold)
			Text("PITTSBURGH PUBLIC SCHOOLS BOARD OF DIRECTORS").horizontalAlignment(.center).font(.title2).fontWeight(.light)
		}
		.foregroundStyle(.white)
		.frame(alignment: .center)
		.padding()
		ZStack {
				Image("/images/tcpFlyer.JPG",
					  description: "Vote Tawana Cook Purnell for District 1 School Board on May 26")
					.resizable()
					.padding(.horizontal)
			VStack {
				Spacer(size: 800)
				Text("PREPARING PITTSBURGH'S CHILDREN TODAY FOR A BETTER WORLD TOMORROW!")
					.horizontalAlignment(.center)
					.font(.title2)
					.fontWeight(.bold)
					.background(Color.gold)
					.foregroundStyle(.black)
					.padding()
			}
		}
		.background(.black)
		Group {
			List {
				Text(markdown: "A highly experienced **EDUCATOR** with a graduate degree in **SCHOOL LEADERSHIP**").horizontalAlignment(.center)
				Text(markdown: "Known for creating **SAFE** and **HEALTHY** schools").horizontalAlignment(.center)
				Text(markdown: "Spent a career as a **TEACHER** and **ADMINISTRATOR**").horizontalAlignment(.center)
				Text(markdown: "Served in public, independent, catholic, and charter schools").horizontalAlignment(.center)
				Text(markdown: "Worked on local, regional, and national boards").horizontalAlignment(.center)
				Text(markdown: "Makes bold, thoughtful decisions that support **STUDENT SUCCESS**, enhance **FACULTY SATISFACTION**, increase **FAMILY ENGAGEMENT**, and build **COMMUNITY COLLABORATIONS**").horizontalAlignment(.center)
			}.font(.title3)
		}
		.foregroundStyle(.white)
		.frame(alignment: .center)
		.padding()
    }
}
