#!/usr/bin/env io

m := Matrix dim(2, 3)

for(i, 0, 1,
  for(j, 0, 2,
    m set(i, j, i * 3 + j)
  )
)

m println
m transpose println