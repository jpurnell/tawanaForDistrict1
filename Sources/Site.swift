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
    var name = "Hello World"
    var titleSuffix = " – My Awesome Site"
    var url = URL(static: "https://www.example.com")
    var builtInIconsEnabled = true

    var author = "John Appleseed"

    var homePage = Home()
    var layout = MainLayout()
}
