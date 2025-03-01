import Foundation
import Ignite

//struct MainLayout: Layout {
//    var body: some HTML {
////        HTML { }  //Required only if you need to add extra functionality, like analytics
//		Head() {
//			Title("Tawana Purnell")
//			MetaTag(name: "description", content: TawanaPurnell().description)
//			Script(file: "https://www.googletagmanager.com/gtag/js?id=G-T80JP1PM8L")
//			Script(code: """
//			  window.dataLayer = window.dataLayer || [];
//			  function gtag(){dataLayer.push(arguments);}
//			  gtag('js', new Date());
//
//			  gtag('config', 'G-T80JP1PM8L');
//""")
//			MetaLink(href: "/css/main.css", rel: "stylesheet")
//		}
//        Body {
//			content.background(.black).width(.max)
//		}
//    }
//}

struct MainLayout: ContentPage {
	func body(content: Content, context: PublishingContext) -> [any BlockElement] {
		Text("About").font(.title1).class("mainTitle")
		for content in context.content(ofType: "about-Tawana") {
			Image(content.image ?? "default", description: (content.metadata["imageDescription"] as! String))
				.resizable()
				.frame(width: "130px", height:  "130px")
				.style("float: left", "margin-right: 1%", "margin-bottom: 1%")
			Text(content.body).frame(width: "70%", maxWidth: "800px")
		}
	}
}

struct MyTheme: Theme {
	func render(page: Page, context: PublishingContext) -> HTML {
		HTML {
			Head(for: page, in: context) {
				MetaTag(name: "description", content: TawanaPurnell().description)
				Script(file: "https://www.googletagmanager.com/gtag/js?id=G-T80JP1PM8L")
				Script(code: """
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'G-T80JP1PM8L');
""")
				MetaLink(href: "/css/main.css", rel: "stylesheet")
			}

			Body {
				NavBar()
				Section { page.body	}
//				.width(.max)
			}
			.background(.black)
		}
	}
}
