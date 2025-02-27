import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = TawanaPurnell()

        do {
			try await site.publish(buildDirectoryPath: "docs")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct TawanaPurnell: Site {
    var name = "Tawana Cook Purnell"
    var titleSuffix = " – Candidate for School Board District 1"
    var url = URL(static: "https://www.tawanacookpurnell.net")
	var description = "Official Homepage for Tawana Cook Purnell, candidate for Pittsburgh's District 1 School Board"
	
	var language: Locale.Language = .init(identifier: "en-US")
	var builtInIconsEnabled = true
	var feedConfiguration = RSS()
	var robotsConfiguration = Robots()
	
    var author = "Justin Purnell"

    var homePage = Home()
    var layout = MainLayout()
}
