import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some HTML {
//        HTML { }  //Required only if you need to add extra functionality, like analytics
		Head() {
			Title("Tawana Purnell")
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
			content.background(.black).width(.max)
		}
    }
}
