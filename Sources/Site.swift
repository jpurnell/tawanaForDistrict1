import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        let site = ExampleSite()

        do {
			try await site.publish(buildDirectoryPath: "docs")
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ExampleSite: Site {    
    var name = "Tawana Cook Purnell"
    var titleSuffix = " – Candidate for School Board District 1"
    var url = URL(static: "https://www.tawanacookpurnell.net")
    var builtInIconsEnabled = true

    var author = "Justin Purnell"

    var homePage = Home()
    var layout = MainLayout()
}
