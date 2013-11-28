#!/usr/bin/env io

fibSeq := method(n,
  a := 1
  b := 1
  tmp := 0
  for(i, 3, n,
    tmp = b
    b = a + b
    a = tmp
  )
  b
)

fibSeq(0) println
fibSeq(1) println
fibSeq(2) println
fibSeq(3) println
fibSeq(4) println
fibSeq(10) println

fibRecur := method(n,
  if(n < 3,
    1,
    fibRecur(n - 1) + fibRecur(n - 2)
  )
)

fibRecur(0) println
fibRecur(1) println
fibRecur(2) println
fibRecur(3) println
fibRecur(4) println
fibRecur(10) println
