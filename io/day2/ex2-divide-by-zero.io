#!/usr/bin/env io

(1 / 0) println

originalDivide := Number getSlot("/")

Number / := method(b,
  if(b == 0, 0, self originalDivide(b))
)

(1 / 0) println
(10 / 2) println
