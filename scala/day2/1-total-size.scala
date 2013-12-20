val words = "Next we looked at various collections Scala supports three lists maps and sets A set is a collection of objects A list is an ordered collection Finally maps are key-value pairs As with Ruby you saw the powerful combinations of code blocks and collections of various kinds We looked at some collection APIs that are indicative of functional programming paradigms For lists we could also use Lisp-style first and rest methods just like Prolog to return the first element of the list or the rest We also used count isEmpty and first methods for obvious purposes But the most powerful methods took function blocks We iterated with foreach and used filter to selectively return various elements of the lists We also learned to use foldLeft to accumulate results as we iterated through a collection to do things such as keeping a running total Much of functional programming is learning to manipulate collections with higher-level constructs instead of Java-style iteration We will put these skills through their paces in day 3 when we will learn to use concurrency do some XML and work a simple practical example Stay tuned".split(" ")

val count = (0 /: words)(_ + _.size)
println("Total count is: %d".format(count))