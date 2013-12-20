import scala.io._
import scala.actors._
import scala.xml.parsing.XhtmlParser
import java.net.URL
import Actor._

object PageLoader {
  def getPageSize(url: String) = Source.fromURL(url).mkString.length
}

val linkRegex = """(?i)<a[^>]+href=['"]([^'"]+)['"][^>]*>""".r
val url = "http://www.google.com"
val html = Source.fromURL(url).mkString
val baseURL = new URL(url)
val caller = self

val links = for (linkRegex(href) <- linkRegex findAllIn html) yield href

var totalLength = html.length
var size = 0

for (link <- links) {
  size += 1
  val absoluteLink = new URL(baseURL, link).toString
  actor {
    size = try {
      PageLoader.getPageSize(absoluteLink)
    } catch {
      case _ => 0
    }
    caller ! size
  }
}

for (i <- 1 to size) {
  receive {
    case size: Int =>
      println("PAGE SIZE: " + size)
      totalLength += size
  }
}

println("Total size for " + url + ": " + totalLength)
