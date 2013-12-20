case class Slot(kind: Char)
val E = Slot(' ')
val X = Slot('X')
val O = Slot('O')

abstract class Result
case class Winner(who: Char) extends Result
case class Tie() extends Result
case class Ongoing() extends Result

val SLOT_AMOUNT = 9

class Board(val slots: List[Slot]) {
  def this() {
    this(List.fill(SLOT_AMOUNT)(E))
  }

  def place(slot: Slot, position: Int) = new Board(slots.updated(position - 1, slot))

  def threeInStrait(kind: Slot): Boolean = slots match {
    case `kind` :: `kind` :: `kind` :: _ => true
    case _ :: _ :: _ :: `kind` :: `kind` :: `kind` :: _ => true
    case _ :: _ :: _ :: _ :: _ :: _ :: `kind` :: `kind` :: `kind` :: List() => true
    case `kind` :: _ :: _ :: `kind` :: _ :: _ :: `kind` :: _ => true
    case _ :: `kind` :: _ :: _ :: `kind` :: _ :: _ :: `kind` :: _ => true
    case _ :: _ :: `kind` :: _ :: _ :: `kind` :: _ :: _ :: `kind` :: List() => true
    case `kind` :: _ :: _ :: _ :: `kind` :: _ :: _ :: _ :: `kind` :: List() => true
    case _ :: _ :: `kind` :: _ :: `kind` :: _ :: `kind` :: _ => true
    case _ => false
  }

  lazy val threeXInStrait = threeInStrait(X)
  lazy val threeOInStrait = threeInStrait(O)

  lazy val isXWin = threeXInStrait && !threeOInStrait
  lazy val isOWin = !threeXInStrait && threeOInStrait
  lazy val isTie = threeXInStrait && threeOInStrait
  lazy val isOngoing = !threeXInStrait && !threeOInStrait

  lazy val result = (threeXInStrait, threeOInStrait) match {
    case (true, true) => Tie()
    case (true, false) => Winner('X')
    case (false, true) => Winner('O')
    case _ => Ongoing
  }

  def sayResult() {
    val message = result match {
      case Tie() => "Tie!"
      case Winner('X') => "X Wins!"
      case Winner('O') => "O Wins!"
      case _ => ""
    }
    println(message)
  }

  private def displayRow(slots: List[Slot], start: Int) {
    slots match {
      case Slot(a) :: Slot(b) :: Slot(c) :: remainings =>
        printf("%s%s%s\n", slotChar(a, start), slotChar(b, start + 1), slotChar(c, start + 2))
        displayRow(remainings, start + 3)
      case _ =>
    }
  }

  private def slotChar(slot: Char, pos: Int) = slot match {
    case ' ' => pos.toString
    case _ => slot.toString
  }

  def display() {
    displayRow(slots, 1)
  }
}

def playTicTacToe(board: Board, turn: Slot) {
  board.display()
  printf("%c turn (1-9): ", turn.kind)
  val pos = readInt()
  val newBoard = board.place(turn, pos)
  if (newBoard.isOngoing) {
    val nextTurn = turn match {
      case X => O
      case _ => X
    }
    playTicTacToe(newBoard, nextTurn)
  } else {
    newBoard.display()
    newBoard.sayResult()
  }
}

val board = new Board()
playTicTacToe(board, O)
