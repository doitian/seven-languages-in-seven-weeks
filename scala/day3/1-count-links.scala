import scala.io._
import scala.actors._
import scala.xml.parsing.XhtmlParser
import Actor._

object PageLoader {
  val linkRegex = """(?i)<a[^>]+href=['"]([^'"]+)['"][^>]*>""".r
  
  def countPageLinks(url : String) = {
    linkRegex.findAllIn(Source.fromURL(url).mkString).size
  }
}

val urls = List(
  "http://www.google.com/",
  "http://www.cnn.com/"
)

val caller = self

for(url <- urls) {
  actor { caller ! (url, PageLoader.countPageLinks(url)) }
}

for(i <- 1 to urls.size) {
  receive {
    case (url, amount) =>
      println("Links # for " + url + ": " + amount)
  }
}
