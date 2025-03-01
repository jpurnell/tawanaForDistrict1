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

	var url = URL(string: "https://www.tawanacookpurnell.net")!
	
	var name = "Candidate for School Board District 1"
    var titleSuffix = " – Tawana Cook Purnell"
	var description = "Official Homepage for Tawana Cook Purnell, candidate for Pittsburgh's District 1 School Board"
	
	var language: Locale.Language = .init(identifier: "en-US")
	var builtInIconsEnabled = true
	var feedConfiguration = RSS()
	var robotsConfiguration = Robots()
	
    var author = "Justin Purnell"
	
	var homePage = Home()
	var theme = MyTheme()
	
	var pages: [any StaticPage] {
		Home()
		Meet()
		Excellence()
		Safety()
		Stewardship()
		Endorsements()
	}
	var layouts: [any ContentPage] {
		AboutLayout()
		MainLayout()
	}
}

public enum SiteLocation: String {
	case production = "https://www.tawanacookpurnell.net"
	case staging = "https://staging.tawanacookpurnell.net"
}

func siteLocation(_ site: SiteLocation) -> String {
	return site.rawValue
}

public func deployment() -> SiteLocation {
	return .production
}

extension Color {
	public static let princetonOrange = Color(hex: "#EE7F2D")
	public static let steelerGold = Color(hex: "#FFB612")
}
