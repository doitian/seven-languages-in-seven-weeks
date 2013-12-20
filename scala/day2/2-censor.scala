trait Censor {
  def censorFilter(dictionary: Map[String, String]): String = {
    toString.split(" ").map { word =>
      dictionary.getOrElse(word, word)
    }.mkString(" ")
  }
}

val demoDictionary = Map(
  "shoot" -> "pucky",
  "Shoot" -> "Pucky",
  "darn" -> "beans",
  "Darn" -> "Beans"
)

class Article(val content: String) extends Censor {
  override val toString = content
}

val article = new Article("Shoot I should have came earlier")
println(article.censorFilter(demoDictionary))
