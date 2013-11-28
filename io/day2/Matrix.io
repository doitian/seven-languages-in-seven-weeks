Matrix := List clone

Matrix dim := method(x, y,
  Matrix clone for(i, 1, y, push (list() setSize(x)))
)

Matrix get := method(x, y,
  self at(y) at(x)
)

Matrix set := method(x, y, val,
  self at(y) atPut(x, val)
)

Matrix sizeX := method(
  if(size == 0, 0, at(0) size)
)

Matrix sizeY := Matrix getSlot("size")

Matrix transpose := method(
  newMatrix := Matrix dim(self sizeY, self sizeX)
  for(i, 0, self sizeX - 1,
    for(j, 0, self sizeY - 1,
      newMatrix set(j, i, get(i, j))
    )
  )
  newMatrix
)

Matrix save := method(path,
  f := nil
  e := try(
    f = File open(path) truncateToSize(0)
    f write(serialized)
  )
  if(f, f close)
  e pass
)

Matrix load := method(path,
  f := nil
  m := nil
  e := try(
    f = File openForReading(path)
    m = doString(f readLines join) setProto(Matrix)
  )
  if(f, f close)
  e pass

  m
)
