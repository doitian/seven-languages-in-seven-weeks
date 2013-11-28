#!/usr/bin/env io

m := Matrix dim(2, 3)

for(i, 0, m sizeX - 1,
  for(j, 0, m sizeY - 1,
    m set(i, j, i * m sizeY + j)
  )
)

m println

m save("/tmp/m.io")
n := Matrix load("/tmp/m.io")

n println