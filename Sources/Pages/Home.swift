import Foundation
import Ignite

struct Home: StaticLayout {
    var title = "Home"

    var body: some HTML {
		Text("Vote")
        Text("Tawana Cook Purnell").font(.title1).fontWeight(.bold)
		Text("For District 1").font(.title2).fontWeight(.bold)
		Text("PITTSBURGH PUBLIC SCHOOLS BOARD OF DIRECTORS").font(.title2)
		
    }
}
