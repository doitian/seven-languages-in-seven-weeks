#!/usr/bin/env io

List myAverage := method(
  if(self isEmpty, 0, self sum / self size)
)

list(1, 2, 3) myAverage println
list() myAverage println
try(list(1, "foo") myAverage) println