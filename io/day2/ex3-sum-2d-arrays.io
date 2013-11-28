#!/usr/bin/env io

numbers := list(
  list(1, 2, 3, 4, 5),
  list(6, 7, 8, 9, 10)
)

flattenSum := method(numbers,
  sum := 0
  numbers foreach(e,
    if(e proto == List, flattenSum(e), e)
    sum = sum + if(e proto == List, flattenSum(e), e)
  )
  sum
)

flattenSum(numbers) println