#!/usr/bin/env io

target := Random value(100) round
answer := nil

10 repeat(
  "Guess the number (0~99): " print
  answer := File standardInput readLine asNumber
  if(answer == target, "Bingo!!!" println; break)
  if(answer < target,
    "Colder" println,
    "Hotter" println
  )
)

if(answer != target, "Game Over" println)
