# import Range
Range


OperatorTable addAssignOperator(":", "hashPairAssign")

Map hashPairAssign := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Builder := Object clone

Builder INDENTATION := "  "

Builder currentIndentation := 0

Builder forward := method(
  whitespaces := 0 to(self currentIndentation) asList rest map(evalArg(self INDENTATION)) join
  args := call message arguments
  attributes := self doMessage(args first)
  if(attributes proto == Map,
    args removeFirst,
    attributes = Map clone
  )

  write(whitespaces, "<", call message name)
  attributes isEmpty ifFalse(
    write(" ")
    attributes foreach(k, v,
      write(k, "=\"", v, "\"")
    )
  )
  writeln(">")
  self currentIndentation = self currentIndentation + 1
  args foreach(arg,
  	content := self doMessage(arg);
  	if(content type == "Sequence", writeln(self INDENTATION, whitespaces, content))
  )
  self currentIndentation = self currentIndentation - 1
  writeln(whitespaces, "</", call message name, ">")
)

Builder curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    # Changed OperatorTable is not effect when using doMessage here, see
    #   http://www.bennadel.com/blog/2067-Seven-Languages-In-Seven-Weeks-Io-Day-3.htm
    r doString(arg asString)
  )
  r
)
