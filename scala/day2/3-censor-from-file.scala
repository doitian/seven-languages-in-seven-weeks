trait Censor {
  def censorFilter(dictionary: Map[String, String]): String = {
    toString.split(" ").map { word =>
      dictionary.getOrElse(word, word)
    }.mkString(" ")
  }
}

class Article(val content: String) extends Censor {
  override val toString = content
}

val dictionary = Iterator.continually(Console.readLine).takeWhile(_ != null).foldLeft(Map[String, String]()) { (m, line) =>
  val parts = line.split(":")
  m + (parts(0) -> parts(1))
}

val article = new Article("Shoot I should have came earlier")
println(article.censorFilter(dictionary))
