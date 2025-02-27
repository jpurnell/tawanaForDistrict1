import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some HTML {
//        HTML { }  //Required only if you need to add extra functionality, like analytics
		Head() {
			MetaTag(name: "description", content: TawanaPurnell().description)
			MetaTag(name: "fediverse:creator", content: "@jpurnell@mastodon.social")
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
			content.background(.black)
		}
    }
}
